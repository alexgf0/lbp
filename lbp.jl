using FileIO, FixedPointNumbers
using Images, ImageView
using ColorTypes

#constants
SAVE_OUTPUT = true
SHOW_IMAGE = true
SECONDS_SHOWING_IMG = 5
OUTPUT_FILENAME = "output.png"


# calculate lbp value for a 9x9 matrix
function cell_value(cell_matrix::Matrix{Gray{N0f8}})
	result = 0
	#from most to less significant 
	result += (cell_matrix[1,1] >= cell_matrix[2,2]) << 7
	result += (cell_matrix[1,2] >= cell_matrix[2,2]) << 6
	result += (cell_matrix[1,3] >= cell_matrix[2,2]) << 5
   	result += (cell_matrix[2,1] >= cell_matrix[2,2]) << 4
   	result += (cell_matrix[2,3] >= cell_matrix[2,2]) << 3
   	result += (cell_matrix[3,1] >= cell_matrix[2,2]) << 2
	result += (cell_matrix[3,2] >= cell_matrix[2,2]) << 1
	result += (cell_matrix[3,3] >= cell_matrix[2,2]) << 0

	return result/255
end


# returns the result with 1px borders unchanged
function lbp(gray_img::Matrix{Gray{N0f8}})
	result = copy(gray_img)

	for r_idx in 2:(size(img)[1]-1)
		for c_idx in 2:((size(img)[2])-1)
			result[r_idx, c_idx] = cell_value(gray_img[r_idx-1:r_idx+1, c_idx-1:c_idx+1])
		end
	end
	return result
end





args_size = size(ARGS)[1]

if args_size < 1
	throw(ArgumentError("You need to pass an image route as a parameter."))
elseif args_size > 1
	@warn "This program will only use the first input parameter: " * ARGS[1]
end

img = load(ARGS[1])

#probably need something that waits until the image is closed.


lbp_img = lbp(Gray.(img))

if SHOW_IMAGE
	imshow(lbp_img)
	sleep(SECONDS_SHOWING_IMG)
end
#mosaicview(img, lbp_img; nrow=1)
sleep(2)

if SAVE_OUTPUT
	lbp_img |> save(OUTPUT_FILENAME)
end

# Load image -> load("path")
# Show image -> imshow(img)
# Save image -> save(img)

