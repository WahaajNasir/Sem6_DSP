%Task 3
Video = VideoReader("Video.mp4")

numFrames = ceil(Video.Duration * Video.FrameRate);
frames=cell(numFrames, 1)

for k=1:numFrames
    frame = read(Video, k);
    frames{k} = frame;
    imshow(frame)
end

%%
rev_vid = frames(end:-1:1);

for k =1:numFrames
    frame =rev_vid{k};
    imshow(frame)
end