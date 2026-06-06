# YouTube Downloader (Batch Script)

A lightweight, automated Windows batch script designed to download YouTube videos and audio with ease. It leverages the power of `yt-dlp` and `ffmpeg` to provide high-quality downloads while handling dependency installation automatically.

## 🚀 Features

- **Video Downloads**: High-quality MP4 downloads. Specifically configured with `avc1` video codec to ensure maximum compatibility with video editors like **Adobe Premiere Pro**.
- **Music Downloads**: High-quality MP3 (192kbps) audio extraction.
- **Auto-Dependency Management**: Automatically checks for `yt-dlp` and `ffmpeg`. If missing, it attempts to install them via `pip` and `winget`.
- **Organized Storage**: Automatically creates and saves all downloads to `%USERPROFILE%\Downloads\YouTube_Downloads`.
- **Stay-Open Mode**: The script remains open after tasks are finished, allowing you to review logs or check for errors.

## 🛠️ Prerequisites

To run this script effectively, you should have the following installed on your Windows machine:

1.  **Windows OS**: Designed specifically for Windows environments (.bat script).
2.  **Python**: Required for installing and updating `yt-dlp` via `pip`.
3.  **Internet Connection**: Required for downloading media and dependencies.

## 📦 Core Dependencies

The script utilizes two main tools:

### 1. [yt-dlp](https://github.com/yt-dlp/yt-dlp)
The primary command-line media downloader. It is a feature-rich fork of the now-deprecated `youtube-dl`.
- **How it's used**: Fetches the video/audio streams from YouTube and other supported sites.
- **Installation**: The script will automatically run `pip install -U yt-dlp` if it's not detected.

### 2. [FFmpeg](https://ffmpeg.org/)
A complete, cross-platform solution to record, convert, and stream audio and video.
- **How it's used**: Essential for merging high-quality video and audio streams (which YouTube serves separately) and converting audio to MP3 format.
- **Installation**: The script attempts to install it via `winget install gyan.ffmpeg` if it's missing.

## 📖 How to Use

1.  **Download/Clone**: Save `raw_yt-DL.bat` to your computer.
2.  **Run**: Double-click the `.bat` file to launch the downloader.
3.  **Input Link**: Paste the YouTube URL when prompted.
4.  **Choose Mode**:
    -   Type `V` for **Video** (Best quality MP4).
    -   Type `M` for **Music** (High quality MP3).
5.  **Finish**: Once the download is complete, the file will be waiting in your `Downloads/YouTube_Downloads` folder.

## 📂 Download Path
By default, the script saves all files here:
`C:\Users\<YourUsername>\Downloads\YouTube_Downloads`

## 🔧 Technical Details (CLI Commands)

For those interested in the underlying commands used:

- **Video (Premiere Pro Compatible)**:
  ```bash
  yt-dlp -f "bestvideo[vcodec*=avc1]+bestaudio[ext=m4a]/best[ext=mp4]/best" --merge-output-format mp4 "URL"
  ```
- **Music (MP3 Extraction)**:
  ```bash
  yt-dlp -x --audio-format mp3 --audio-quality 192K "URL"
  ```

## ⚠️ Troubleshooting

-   **"pip is not recognized"**: Ensure Python is installed and added to your system's PATH.
-   **"ffmpeg not found"**: If the `winget` installation fails, you may need to download FFmpeg manually from the [official site](https://ffmpeg.org/download.html) and add it to your PATH.
-   **Download Fails**: YouTube frequently updates its site. If downloads fail, the script will attempt to update `yt-dlp` automatically. You can also manually run `pip install -U yt-dlp` in a command prompt.

---
*Note: This tool is intended for personal use. Please respect copyright laws and the terms of service of the platforms you download from.*

