Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067575;
	b=hvjxTUhsvKfzxNOaLrhajsaz6Ov6aBp6f+ShZ7ww+FrP0p2VVu0eFePnI6pKMZQxu12h
	 EwDrjJC/OSQwwsUue7NKuJgZVwlSJwmtsfBngpgHwRlr8UtxblNHcHpV04MlD7lKOZ55e
	 RrY5XbfGoUrl0rH9MQnLzCz71jnrJV8nazH17vocX3/rG8dyXOBHvZYtjrY16ssP77gse
	 M/vr7s2O6+B1oeq5mA1A/jPW+V71LgvFLc8u4J36WoKZcAuK4yWCS3C0BKlhbsuZcUI2/
	 K1xrH2R66MSH8H0mZvHjCsQ+axWRV07ekh9ZKl0sqrrebhvp6vaCxtrQqZZkWD40mQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FvGkGFPYz8+KYBcINAaK6j1K6Fdi7c7ydCjuXhI7sng=;
	b=pL8mfqgqayWAXVq+jJTRrhz5dtLkXuMjj8c1NjF60euhFNYKiCxEHVD+ZGYRV/qMRQyv
	 m/+yRrvC/NXW0hZH1XqqK4a/B/NXfazFmrj8Cm1el4mbXJrF+r92zJzEUPdcxkXOGcBQI
	 3JYxFIzFGpj1R200sXedhy6XU5twtlk8AhJpgfGqALB+TA/4W+EhA+Pm5h3iL+fCPxl3w
	 6jABuZXCYJ6b50OG7hHl6BJU3bzPoWU5gnLtso4Zlc9aU0jnRBRgap+nUEecCwrtJr/+g
	 qPDEGHwHqfYXMJTNrCeWHNai4j1IFrPdsoO6zwM7uMacgH8zKOR6H9ZFAkDWfgbfQvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DPp+dTyB;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F0606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 02:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DPp+dTyB
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6798d4ab549so3540327d50.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 19:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793067574; x=1793672374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvGkGFPYz8+KYBcINAaK6j1K6Fdi7c7ydCjuXhI7sng=;
        b=DPp+dTyB+6pjzFXeNV4sR+rIXzySScLVo7ZDlen2RcX8F357FW7wJeD/GirUl9L5ni
         WUtqHExapuHU685taOQDkLVWPDoBJ1HaTRPHSyxmWpT+yVXb/QPdSpm3k5/1oeFrLjwR
         Sjr7mTp3wY2G0SVcBeZKNLF9bY6DReT6oOrhncTuI4oEaJzPjRUXzSI77TGFB46XTYGA
         F2nIGp+NvUp9KoWeXb6qOCLyobIggJalyq+JVZyLPoWlDL5U53rsLn+NgbW/lFyot45L
         kijEUFM0qv+Ug0fL2HBtCssGNEtveUCCTkpR2lfsOTht/EA6Ath705KU/3Nc3t83Ufya
         dTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793067574; x=1793672374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvGkGFPYz8+KYBcINAaK6j1K6Fdi7c7ydCjuXhI7sng=;
        b=aVCF0HzYCLqVGIZ5G4+NtQb0111XZiwl4m3k/p7ZS/SZfytcMN+ZwKpgQ+Pux1yc3n
         FpofUuegiwSHD1YqGDUSHlYYVAZM0k5LSdOJd6KvAzvotdg5tB6tubQ9iBijdxMy/DEq
         R0DYmkrw4kfbyIYZ4Sh1XTbNJwb8auwT/WnyvUl9T120j6r6XWr2IGKiarQugAqqE6Fm
         eJKuNVsudoZ1uKdVKsdgRnGTm3SaEH0BkH8qwfHYEVsXcy6FJLgUkE+d/HszHHkqnR8M
         /9LSDI53vlLj48W69+xB+w921GnL6ruOxn4xoFnXvXMBIaxvcQdQ1mlU9mF8m/Z78xrQ
         lqiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6uzBOTp/wQgGlKCoF1ExPFURq2uNO1IvZY9GlvjRTrSkSMuBhI0MoUBTN4bG3Yeq/mVA+rTbJ30aQYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQrqNEgvJTByYAWEm7iJAccBHYpIpk5PPZR2IcOeayJ1WjLdni
	xdU8m6n/Z4tnUlxK2659lbViosQxZKbvzRf2dgi2VnTneZrqUZuWRx39
X-Gm-Gg: AYBFou1Wb7I9OTHZ7XDoizFcA4LPToenv3KLn7TYbLOXqBa6L2DloJhsTKnGNeXYCif
	QRij4jyan1ONJjUgfSvKLOaNt/8DfrhE1xDbHMONxoE+dRgHImgpIp4slQ19OQGoddy0I8QtNd0
	yclLKXSGe9eBqFtXVDzbXIfaAiItBLJ3t7j+Jwor++P69xMM+JoL44t78TR3Mqd41WqHmznwtkb
	Zt9qE10WDtB0k8VVDJQQm5n0vKU8NbKnjoVXZWmQyvPsNLT1OF3mMBS93Bcn45WOE8+DkLqQ6IN
	aoqYkQVbQUWbjUuLk8vSIr+dCBYx8rh+uK8pG+Belc6jh0Yl+5HS4CEZzNuwdrqUN0D9iXeOPhb
	NhU6IvVo8sGoGyQn0pzCDy52aF+3G0qA1TwKbjBKuIUJiJRq8uUtuV3YcNpFbVdqhz7mElP2IWe
	0FT6U6tR9IE/784yfRAnwWRfFakF/6/KeZNFc1eix0fZNLh/dO8BqtavD4TA9Q35Y3HRZz4HXBF
	Pw+uSqM3ExJCPk8mFzWum3QPewPCUhi/JLDb/SzUNRyDZDcRJgUcOpQ3FtU79JtEjxRhOaniRW1
	wv1uYw/5gFWY/3SXGvwx+CQ7R+VEOkZj
X-Received: by 2002:a05:690e:138e:b0:675:5d66:765f with SMTP id 956f58d0204a3-67a45383866mr6850222d50.28.1793067573892;
        Mon, 26 Oct 2026 19:19:33 -0700 (PDT)
Received: from localhost (h159-112-31-107.euclwi.broadband.dynamic.tds.net. [159.112.31.107])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a45ff8d6dsm4392528d50.1.2026.10.26.19.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:19:33 -0700 (PDT)
From: Christian Cortner <ccortner@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Birk Skyum <birk.skyum@pm.me>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [BUG] media: iris: resolution change handling stops ffmpeg's h264_v4l2m2m decoder on glymur
Date: Mon, 26 Oct 2026 21:19:32 -0500
Message-ID: <179306719855.20070.15625203453374418392.iris-rfc-reply@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <36201ae2-1cee-4d8d-9381-dfc9013c522e@kernel.org>
References: <20261026160952.22082-1-ccortner@gmail.com> <36201ae2-1cee-4d8d-9381-dfc9013c522e@kernel.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1676936801974189972=="
Content-Transfer-Encoding: 8bit

--===============1676936801974189972==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 26/10/2026 22:31, Bryan O'Donoghue wrote:
> Err thanks for the bug report but, if you have a test-case and a
> resolution - even of the code sucks and/or you don't understand it,
> please post the code.
>
> One of us can take up the task of finishing it off.

Will do. The five changes follow as an RFC series in reply to this
mail, not for merging and without a Signed-off-by, since I can't
review them myself. First a correction to my report, and a bug that
Birk's results led to. As before, I traced this with an AI coding
assistant.


Correction

Problem 1 in my report says that a client which sets up CAPTURE early
decodes every frame when it sends V4L2_DEC_CMD_START after the LAST
buffer, and the results say that ffmpeg decodes bit-exact with all
five changes. Both were measured with x264 -preset ultrafast clips
(Constrained Baseline), for which the firmware asks for three frame
buffers. With x264's default settings, which Birk's clips probably
used, it asks for six, and then the change for problem 1 (patch 5 of
the series) fails: at 640x360 every ffmpeg run ends in five lines of

  qcom-iris aa00000.video-codec: session error received 0x4000003: fatal error

and ffmpeg then gets EIO and aborts. Patch 5 resumes the firmware
through iris_vdec_start_cmd(), so it runs into the bug below. A client
that sends V4L2_DEC_CMD_START after the LAST buffer at the start
should fail the same way with these streams; I could not test that,
because on my kernel patch 5 handles that source change. At 720p
ffmpeg decodes these streams fine: there the first source change
arrives before ffmpeg starts CAPTURE, and the driver takes its normal
path.


Resuming with V4L2_DEC_CMD_START does not grow the internal buffers

When a resolution change raises the number of frame buffers a stream
needs, and the client resumes with V4L2_DEC_CMD_START after the LAST
buffer instead of reallocating CAPTURE, the firmware fails right after
the resume with the same five errors. Step 6 of the Capture Setup
sequence in dev-decoder.rst allows that resume when the CAPTURE
buffers are large enough and there are at least as many as the new
minimum, as here: 16 allocated, 6 needed.

To reproduce, make one second of an x264 ultrafast stream (three
frame buffers) followed by one second of an x264 default stream
(six), both 640x360, so that the second source change raises the
count at the same size:

  ffmpeg -f lavfi -i testsrc2=duration=1:size=640x360:rate=30 \
    -pix_fmt yuv420p -c:v libx264 -preset ultrafast -f h264 a.h264
  ffmpeg -f lavfi -i testsrc2=duration=1:size=640x360:rate=30 \
    -pix_fmt yuv420p -c:v libx264 -f h264 b.h264
  cat a.h264 b.h264 > ab.h264

and decode it with the attached test client, which sets up CAPTURE
after the first event, the way GStreamer does (-d selects the device
node, default /dev/video0):

  gcc -O2 -Wall -o iris-drc-test iris-drc-test.c
  ./iris-drc-test -i ab.h264 -s 640x360 -m late -o out.nv12
  ./iris-drc-test -i ab.h264 -s 640x360 -m late -A -o out.nv12

The first run resumes with V4L2_DEC_CMD_START at the second source
change: the fatal errors, and only the first 30 of 60 frames (2 of 2
runs). The second (-A) reallocates CAPTURE instead: all 60 frames,
identical to "ffmpeg -i ab.h264 -f rawvideo -pix_fmt nv12" (2 of 2).
With the halves swapped, so that the count falls from 6 to 3,
resuming with V4L2_DEC_CMD_START works.

The kernel was the one from my report, with the five changes. Patch 5
acts only on the first source change, and kprobes showed that it did
not act in these runs. None of the changes touches the resume or the
internal buffers; on this path, patch 1 drops the ERROR flag from the
LAST buffer, patch 3 the EOS event at the resolution change, and
patch 4 adds a wake-up when DRC_LAST is set. I have not run this on
an unmodified driver. Birk, if you have a moment, the client would
show whether X1E80100 behaves the same; the fatal errors you saw on
an unmodified driver might have the same cause, but I can't tell
from here.

Not verified, from reading the code: in this case
iris_vdec_start_cmd() only resumes the firmware's ports. The COMV
buffer, sized when it is created from buffers[BUF_OUTPUT].min_count
or fw_min_count (iris_vpu3x_4x_dec_comv_size(), and
HFI_PROP_COMV_BUFFER_COUNT), and in split mode the internal DPB
buffers (iris_vpu_dpb_count()) keep that count. The reallocation
path recreates both at VIDIOC_STREAMON(CAPTURE).

Thanks,
Christian Cortner

--===============1676936801974189972==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="iris-drc-test.c"
MIME-Version: 1.0

// SPDX-License-Identifier: GPL-2.0
/*
 * iris-drc-test - a V4L2 stateful-decoder client that follows dev-decoder.rst, with switches that
 * reproduce what ffmpeg's h264_v4l2m2m does, to separate client bugs from driver bugs.
 *
 *   -m late    set up CAPTURE only after the first SOURCE_CHANGE event (what GStreamer does)
 *   -m early   set up and stream CAPTURE right after OUTPUT STREAMON (what ffmpeg does)
 *   -E         on SOURCE_CHANGE, send V4L2_DEC_CMD_START at once (what ffmpeg does) and report it
 *   -R         do NOT send START again after the LAST buffer (what ffmpeg does); default: send it,
 *              as the spec's Dynamic Resolution Change sequence requires
 *   -F         (early mode) start CAPTURE before feeding the first access unit, so the firmware's first
 *              port-settings change always arrives with CAPTURE streaming (ffmpeg's losing side of the race)
 *   -S         on a SOURCE_CHANGE whose format no longer fits, stop CAPTURE and set it up again at once, without
 *              waiting for the LAST buffer (what ffmpeg's reinit does; the spec's Drain section allows aborting
 *              the implicit drain this way); default: wait for LAST first (Capture Setup step 7)
 *   -A         at a resolution change whose format still fits, reallocate CAPTURE anyway (STREAMOFF, REQBUFS,
 *              STREAMON) instead of resuming with V4L2_DEC_CMD_START: the driver's normal path, as a control
 *
 * Resolution changes: after every CAPTURE (re)setup the visible size is re-read (G_SELECTION, COMPOSE), so a
 * stream that changes size mid-way is written at its native sizes, like ffmpeg -noautoscale.
 *
 * Input is fed one H.264 access unit per OUTPUT buffer. The visible NV12 frames go to -o, for an md5
 * comparison with ffmpeg's software decode (-pix_fmt nv12).
 *
 * Usage: iris-drc-test -i s.h264 -s WxH [-m late|early] [-E] [-R] [-A] [-b capbufs] [-o out.nv12] [-d dev]
 */
#include <errno.h>
#include <fcntl.h>
#include <poll.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>
#include <linux/videodev2.h>

#define MAXBUF 64
#define NOUT 4
#define OUT_SIZE (2 * 1024 * 1024)

struct mbuf { void *start; size_t len; };
struct au { size_t off, len; };

static int fd;
static struct mbuf cap[MAXBUF], out[NOUT];
static unsigned ncap_req = 16, ncap;
static struct v4l2_format capfmt;
static unsigned vis_w, vis_h;
static FILE *outf;

static int xioctl(unsigned long req, void *arg)
{
	int r;
	do { r = ioctl(fd, req, arg); } while (r == -1 && errno == EINTR);
	return r;
}

static void die(const char *what)
{
	fprintf(stderr, "FAIL %s: %s\n", what, strerror(errno));
	exit(2);
}

static double now(void)
{
	struct timespec ts;
	clock_gettime(CLOCK_MONOTONIC, &ts);
	return ts.tv_sec + ts.tv_nsec / 1e9;
}

/* Split an Annex-B stream into access units: a new AU starts at a non-VCL NAL (SEI/SPS/PPS/AUD)
 * that follows a VCL NAL, or at a VCL NAL with first_mb_in_slice == 0 that follows a VCL NAL. */
static size_t split_aus(const uint8_t *b, size_t len, struct au *aus, size_t max)
{
	size_t starts[65536], ns = 0, n = 0;
	for (size_t i = 0; i + 3 <= len && ns < 65536; i++)
		if (b[i] == 0 && b[i + 1] == 0 && b[i + 2] == 1) {
			starts[ns++] = (i > 0 && b[i - 1] == 0) ? i - 1 : i;
			i += 2;
		}
	size_t au_start = 0;
	int seen_vcl = 0;
	for (size_t k = 0; k < ns; k++) {
		size_t hdr = starts[k] + (b[starts[k] + 2] == 1 ? 3 : 4);
		if (hdr >= len)
			break;
		int type = b[hdr] & 0x1f;
		int vcl = (type == 1 || type == 5);
		int first_mb0 = vcl && hdr + 1 < len && (b[hdr + 1] & 0x80);
		int boundary = seen_vcl && ((!vcl && (type == 6 || type == 7 || type == 8 || type == 9)) || first_mb0);
		if (boundary && n < max) {
			aus[n].off = au_start;
			aus[n].len = starts[k] - au_start;
			n++;
			au_start = starts[k];
			seen_vcl = 0;
		}
		if (vcl)
			seen_vcl = 1;
	}
	if (seen_vcl && n < max) {
		aus[n].off = au_start;
		aus[n].len = len - au_start;
		n++;
	}
	return n;
}

static int dec_cmd(unsigned cmd)
{
	struct v4l2_decoder_cmd c;
	memset(&c, 0, sizeof(c));
	c.cmd = cmd;
	return xioctl(VIDIOC_DECODER_CMD, &c) ? -errno : 0;
}

static void setup_output(unsigned w, unsigned h)
{
	struct v4l2_format f;
	memset(&f, 0, sizeof(f));
	f.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
	f.fmt.pix_mp.width = w;
	f.fmt.pix_mp.height = h;
	f.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
	f.fmt.pix_mp.num_planes = 1;
	f.fmt.pix_mp.plane_fmt[0].sizeimage = OUT_SIZE;
	if (xioctl(VIDIOC_S_FMT, &f))
		die("S_FMT output");
	struct v4l2_requestbuffers rb = { .count = NOUT, .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, .memory = V4L2_MEMORY_MMAP };
	if (xioctl(VIDIOC_REQBUFS, &rb) || rb.count < NOUT)
		die("REQBUFS output");
	for (unsigned i = 0; i < NOUT; i++) {
		struct v4l2_buffer b; struct v4l2_plane pl[1];
		memset(&b, 0, sizeof(b)); memset(pl, 0, sizeof(pl));
		b.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE; b.memory = V4L2_MEMORY_MMAP; b.index = i;
		b.m.planes = pl; b.length = 1;
		if (xioctl(VIDIOC_QUERYBUF, &b))
			die("QUERYBUF output");
		out[i].len = pl[0].length;
		out[i].start = mmap(NULL, pl[0].length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, pl[0].m.mem_offset);
		if (out[i].start == MAP_FAILED)
			die("mmap output");
	}
}

static void qbuf_cap(unsigned i)
{
	struct v4l2_buffer b; struct v4l2_plane pl[1];
	memset(&b, 0, sizeof(b)); memset(pl, 0, sizeof(pl));
	b.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE; b.memory = V4L2_MEMORY_MMAP; b.index = i;
	b.m.planes = pl; b.length = 1;
	if (xioctl(VIDIOC_QBUF, &b)) {
		int err = errno;
		struct v4l2_format f;
		memset(&f, 0, sizeof(f));
		f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
		xioctl(VIDIOC_G_FMT, &f);
		fprintf(stderr, "QBUF capture idx=%u failed (%s); buffer len=%zu, format now %ux%u sizeimage=%u\n", i,
			strerror(err), cap[i].len, f.fmt.pix_mp.width, f.fmt.pix_mp.height, f.fmt.pix_mp.plane_fmt[0].sizeimage);
		errno = err;
		die("QBUF capture");
	}
}

/* the visible rectangle of the decoded frames (G_SELECTION COMPOSE), kept in vis_w/vis_h */
static void read_visible(const char *why)
{
	struct v4l2_selection sel;
	memset(&sel, 0, sizeof(sel));
	sel.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	sel.target = V4L2_SEL_TGT_COMPOSE;
	if (xioctl(VIDIOC_G_SELECTION, &sel) == 0 && sel.r.width && sel.r.height) {
		vis_w = sel.r.width;
		vis_h = sel.r.height;
	}
	printf("[%s] visible %ux%u\n", why, vis_w, vis_h);
}

static void setup_capture(const char *why)
{
	memset(&capfmt, 0, sizeof(capfmt));
	capfmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
	if (xioctl(VIDIOC_G_FMT, &capfmt))
		die("G_FMT capture");
	if (!strcmp(why, "early")) {
		/* ffmpeg sets the CAPTURE format at init. Without this, iris's G_FMT after S_FMT(OUTPUT) reports
		 * the new width/height with the stale sizeimage of its 320x240 default, and QBUF fails EINVAL. */
		printf("[%s] G_FMT capture: %ux%u sizeimage=%u -> S_FMT NV12 (as ffmpeg does at init)\n", why,
		       capfmt.fmt.pix_mp.width, capfmt.fmt.pix_mp.height, capfmt.fmt.pix_mp.plane_fmt[0].sizeimage);
		capfmt.fmt.pix_mp.pixelformat = V4L2_PIX_FMT_NV12;
		if (xioctl(VIDIOC_S_FMT, &capfmt))
			die("S_FMT capture NV12");
	}
	struct v4l2_control ctl = { .id = V4L2_CID_MIN_BUFFERS_FOR_CAPTURE };
	int minb = xioctl(VIDIOC_G_CTRL, &ctl) ? -1 : ctl.value;
	unsigned want = ncap_req;
	if (minb > 0 && (unsigned)minb + 1 > want)
		want = minb + 1;
	struct v4l2_requestbuffers rb = { .count = want, .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, .memory = V4L2_MEMORY_MMAP };
	printf("[%s] G_FMT capture before REQBUFS: %ux%u sizeimage=%u\n", why, capfmt.fmt.pix_mp.width,
	       capfmt.fmt.pix_mp.height, capfmt.fmt.pix_mp.plane_fmt[0].sizeimage);
	if (xioctl(VIDIOC_REQBUFS, &rb))
		die("REQBUFS capture");
	ncap = rb.count;
	for (unsigned i = 0; i < ncap; i++) {
		struct v4l2_buffer b; struct v4l2_plane pl[1];
		memset(&b, 0, sizeof(b)); memset(pl, 0, sizeof(pl));
		b.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE; b.memory = V4L2_MEMORY_MMAP; b.index = i;
		b.m.planes = pl; b.length = 1;
		if (xioctl(VIDIOC_QUERYBUF, &b))
			die("QUERYBUF capture");
		cap[i].len = pl[0].length;
		cap[i].start = mmap(NULL, pl[0].length, PROT_READ | PROT_WRITE, MAP_SHARED, fd, pl[0].m.mem_offset);
		if (cap[i].start == MAP_FAILED)
			die("mmap capture");
		qbuf_cap(i);
	}
	read_visible(why);
	printf("[%s] capture %ux%u stride=%u sizeimage=%u min_buffers=%d buffers=%u\n", why,
	       capfmt.fmt.pix_mp.width, capfmt.fmt.pix_mp.height, capfmt.fmt.pix_mp.plane_fmt[0].bytesperline,
	       capfmt.fmt.pix_mp.plane_fmt[0].sizeimage, minb, ncap);
}

static void free_capture(void)
{
	for (unsigned i = 0; i < ncap; i++)
		munmap(cap[i].start, cap[i].len);
	struct v4l2_requestbuffers rb = { .count = 0, .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, .memory = V4L2_MEMORY_MMAP };
	xioctl(VIDIOC_REQBUFS, &rb);
	ncap = 0;
}

static void stream(unsigned type, int on)
{
	if (xioctl(on ? VIDIOC_STREAMON : VIDIOC_STREAMOFF, &type))
		die(on ? "STREAMON" : "STREAMOFF");
}

static void write_frame(unsigned i)
{
	const uint8_t *p = cap[i].start;
	unsigned stride = capfmt.fmt.pix_mp.plane_fmt[0].bytesperline;
	unsigned scan = capfmt.fmt.pix_mp.height;
	for (unsigned y = 0; y < vis_h; y++)
		fwrite(p + (size_t)y * stride, 1, vis_w, outf);
	for (unsigned y = 0; y < vis_h / 2; y++)
		fwrite(p + (size_t)stride * scan + (size_t)y * stride, 1, vis_w, outf);
}

int main(int argc, char **argv)
{
	const char *dev = "/dev/video0", *infile = NULL, *outfile = "/var/tmp/iris-drc-test.nv12", *mode = "late";
	int early_start = 0, no_retry = 0, feed_late = 0, abort_drain = 0, always_realloc = 0, opt;
	while ((opt = getopt(argc, argv, "d:i:s:m:b:o:ERFSA")) != -1) {
		switch (opt) {
		case 'd': dev = optarg; break;
		case 'i': infile = optarg; break;
		case 'o': outfile = optarg; break;
		case 'm': mode = optarg; break;
		case 's': if (sscanf(optarg, "%ux%u", &vis_w, &vis_h) != 2) return 2; break;
		case 'b': ncap_req = atoi(optarg); if (ncap_req < 2 || ncap_req > MAXBUF - 1) return 2; break;
		case 'E': early_start = 1; break;
		case 'R': no_retry = 1; break;
		case 'F': feed_late = 1; break;
		case 'S': abort_drain = 1; break;
		case 'A': always_realloc = 1; break;
		default: fprintf(stderr, "usage: %s -i s.h264 -s WxH [-m late|early] [-E] [-R] [-S] [-F] [-A] [-b n] [-o f] [-d dev]\n", argv[0]); return 2;
		}
	}
	int early = !strcmp(mode, "early");
	if (!infile || !vis_w || !vis_h || (!early && strcmp(mode, "late"))) {
		fprintf(stderr, "need -i, -s and -m late|early\n");
		return 2;
	}
	FILE *in = fopen(infile, "rb");
	struct stat st;
	if (!in || fstat(fileno(in), &st))
		die("open input");
	uint8_t *bs = malloc(st.st_size);
	if (!bs || fread(bs, 1, st.st_size, in) != (size_t)st.st_size)
		die("read input");
	fclose(in);
	static struct au aus[100000];
	size_t naus = split_aus(bs, st.st_size, aus, 100000);
	outf = fopen(outfile, "wb");
	if (!outf)
		die("open output");
	printf("mode=%s early_start=%d retry_after_last=%d feed_after_capture=%d access_units=%zu\n", mode, early_start,
	       !no_retry, feed_late, naus);

	fd = open(dev, O_RDWR | O_NONBLOCK);
	if (fd < 0)
		die("open device");
	struct v4l2_event_subscription sub;
	memset(&sub, 0, sizeof(sub));
	sub.type = V4L2_EVENT_SOURCE_CHANGE;
	if (xioctl(VIDIOC_SUBSCRIBE_EVENT, &sub))
		die("SUBSCRIBE source change");
	sub.type = V4L2_EVENT_EOS;
	xioctl(VIDIOC_SUBSCRIBE_EVENT, &sub);

	setup_output(vis_w, vis_h);
	int out_busy[NOUT] = { 0 };
	size_t next = 0;
	int cap_ready = 0, drc_seen = 0, stop_sent = 0, done = 0, epipe = 0, src_changes = 0, aborted = 0;
	int eos_early = 0, eos_end = 0;
	int frames = 0, empty_last = 0, errors = 0, early_ret = 1, retry_ret = 1;
	double t_last = now(), t0 = now();

	/* first access unit, then OUTPUT STREAMON (both clients do this) */
	#define QUEUE_AU(i) do { \
		memcpy(out[i].start, bs + aus[next].off, aus[next].len); \
		struct v4l2_buffer b; struct v4l2_plane pl[1]; \
		memset(&b, 0, sizeof(b)); memset(pl, 0, sizeof(pl)); \
		b.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE; b.memory = V4L2_MEMORY_MMAP; b.index = i; \
		b.m.planes = pl; b.length = 1; pl[0].bytesused = aus[next].len; \
		b.timestamp.tv_usec = next; \
		if (xioctl(VIDIOC_QBUF, &b)) die("QBUF output"); \
		out_busy[i] = 1; next++; } while (0)
	if (!(early && feed_late))
		QUEUE_AU(0);
	stream(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, 1);
	if (early) {
		setup_capture("early");
		stream(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 1);
		cap_ready = 1;
	}

	while (!done) {
		for (unsigned i = 0; i < NOUT && next < naus; i++)
			if (!out_busy[i])
				QUEUE_AU(i);
		if (next >= naus && !stop_sent && cap_ready) {
			int busy = 0;
			for (unsigned i = 0; i < NOUT; i++)
				busy += out_busy[i];
			if (!busy) {
				int r = dec_cmd(V4L2_DEC_CMD_STOP);
				printf("DEC_CMD_STOP (drain) -> %d\n", r);
				stop_sent = 1;
			}
		}
		struct pollfd pfd = { .fd = fd, .events = POLLIN | POLLOUT | POLLPRI };
		if (poll(&pfd, 1, 500) < 0 && errno != EINTR)
			die("poll");
		struct v4l2_event ev;
		while (xioctl(VIDIOC_DQEVENT, &ev) == 0) {
			t_last = now();
			if (ev.type == V4L2_EVENT_EOS) {
				/* EOS ends a drain; one before our DEC_CMD_STOP marks a resolution change as EOS */
				if (stop_sent)
					eos_end++;
				else
					eos_early++;
				printf("EOS event (%s)\n", stop_sent ? "after our drain" : "BEFORE our drain");
				continue;
			}
			if (ev.type != V4L2_EVENT_SOURCE_CHANGE)
				continue;
			src_changes++;
			printf("SOURCE_CHANGE #%d changes=0x%x at %.1f ms (%s)\n", src_changes, ev.u.src_change.changes,
			       (now() - t0) * 1000, cap_ready ? "CAPTURE already streaming" : "CAPTURE not set up yet");
			if (!cap_ready) {
				setup_capture("after event");
				stream(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 1);
				cap_ready = 1;
			} else {
				/* With CAPTURE streaming the driver may or may not start a Dynamic Resolution
				 * Change; the LAST buffer, not this event, tells (handled below). */
				if (abort_drain) {
					struct v4l2_format f;
					memset(&f, 0, sizeof(f));
					f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
					if (xioctl(VIDIOC_G_FMT, &f))
						die("G_FMT on event");
					if (f.fmt.pix_mp.width != capfmt.fmt.pix_mp.width ||
					    f.fmt.pix_mp.height != capfmt.fmt.pix_mp.height ||
					    f.fmt.pix_mp.plane_fmt[0].sizeimage > capfmt.fmt.pix_mp.plane_fmt[0].sizeimage) {
						printf("  -S: format changed (%ux%u); STREAMOFF/realloc/STREAMON CAPTURE now, before LAST\n",
						       f.fmt.pix_mp.width, f.fmt.pix_mp.height);
						aborted++;
						stream(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 0);
						free_capture();
						setup_capture("realloc-on-event");
						stream(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 1);
						continue;
					}
				}
				{
					/* the buffers still fit: keep them, but frames from now on use the stream's
					 * visible size (the first event replaces the S_FMT placeholder) */
					struct v4l2_format f;
					memset(&f, 0, sizeof(f));
					f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
					if (xioctl(VIDIOC_G_FMT, &f) == 0 &&
					    f.fmt.pix_mp.width == capfmt.fmt.pix_mp.width &&
					    f.fmt.pix_mp.height == capfmt.fmt.pix_mp.height)
						read_visible("event, buffers fit");
				}
				if (early_start) {
					early_ret = dec_cmd(V4L2_DEC_CMD_START);
					printf("  immediate DEC_CMD_START (ffmpeg) -> %d%s\n", early_ret, early_ret == -EBUSY ? " (EBUSY)" : "");
				}
			}
		}
		for (;;) {
			struct v4l2_buffer b; struct v4l2_plane pl[1];
			memset(&b, 0, sizeof(b)); memset(pl, 0, sizeof(pl));
			b.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE; b.memory = V4L2_MEMORY_MMAP; b.m.planes = pl; b.length = 1;
			if (xioctl(VIDIOC_DQBUF, &b))
				break;
			out_busy[b.index] = 0;
			t_last = now();
		}
		while (cap_ready) {
			/* events before buffers, as ffmpeg does: a pending SOURCE_CHANGE is handled first */
			struct pollfd pe = { .fd = fd, .events = POLLPRI };
			if (poll(&pe, 1, 0) > 0 && (pe.revents & POLLPRI))
				break;
			struct v4l2_buffer b; struct v4l2_plane pl[1];
			memset(&b, 0, sizeof(b)); memset(pl, 0, sizeof(pl));
			b.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE; b.memory = V4L2_MEMORY_MMAP; b.m.planes = pl; b.length = 1;
			if (xioctl(VIDIOC_DQBUF, &b)) {
				if (errno == EPIPE) {
					if (!epipe)
						printf("DQBUF capture -> EPIPE (after LAST; ffmpeg treats this as end of stream)\n");
					epipe++;
					if (no_retry)
						done = 1;
				}
				break;
			}
			t_last = now();
			unsigned used = pl[0].bytesused;
			if (b.flags & V4L2_BUF_FLAG_ERROR)
				errors++;
			if (b.flags & V4L2_BUF_FLAG_LAST) {
				printf("LAST buffer: bytesused=%u flags=%s%s at %.1f ms\n", used,
				       b.flags & V4L2_BUF_FLAG_ERROR ? "ERROR|" : "", "LAST", (now() - t0) * 1000);
				if (!used)
					empty_last++;
				else {
					write_frame(b.index);
					frames++;
				}
				if (!stop_sent) {
					/* a LAST before our drain: the decoder started a Dynamic Resolution Change */
					drc_seen++;
					struct v4l2_format f;
					memset(&f, 0, sizeof(f));
					f.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
					if (xioctl(VIDIOC_G_FMT, &f))
						die("G_FMT after DRC");
					int same = f.fmt.pix_mp.width == capfmt.fmt.pix_mp.width &&
						   f.fmt.pix_mp.height == capfmt.fmt.pix_mp.height &&
						   f.fmt.pix_mp.plane_fmt[0].sizeimage <= capfmt.fmt.pix_mp.plane_fmt[0].sizeimage;
					if (same && always_realloc)
						printf("  -A: format unchanged; STREAMOFF/realloc/STREAMON CAPTURE anyway\n");
					if (same && !always_realloc && no_retry) {
						printf("  format unchanged; NOT sending START again (ffmpeg)\n");
					} else if (same && !always_realloc) {
						retry_ret = dec_cmd(V4L2_DEC_CMD_START);
						printf("  format unchanged; DEC_CMD_START after LAST -> %d\n", retry_ret);
						qbuf_cap(b.index);
					} else {
						if (!same)
							printf("  format changed (%ux%u); STREAMOFF/realloc/STREAMON CAPTURE\n", f.fmt.pix_mp.width, f.fmt.pix_mp.height);
						stream(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 0);
						free_capture();
						setup_capture("realloc");
						stream(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 1);
						break;
					}
				} else {
					done = 1;
					break;
				}
				continue;
			}
			if (used && !(b.flags & V4L2_BUF_FLAG_ERROR)) {
				write_frame(b.index);
				frames++;
			}
			qbuf_cap(b.index);
		}
		if (now() - t_last > 5.0) {
			printf("STALLED: no buffer or event for 5 s\n");
			break;
		}
	}
	{
		/* an EOS for the final drain may still be queued */
		struct v4l2_event ev;
		while (xioctl(VIDIOC_DQEVENT, &ev) == 0)
			if (ev.type == V4L2_EVENT_EOS) {
				if (stop_sent)
					eos_end++;
				else
					eos_early++;
			}
	}
	if (cap_ready)
		stream(V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE, 0);
	stream(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE, 0);
	fclose(outf);
	close(fd);
	printf("RESULT mode=%s E=%d R=%d S=%d: fed %zu/%zu AUs, frames=%d, source_changes=%d, aborted_drains=%d, DRC_LAST=%d, empty_LAST=%d, ERROR-flagged=%d, "
	       "early_START=%d, START_after_LAST=%d, EPIPE=%d, EOS_early=%d, EOS_end=%d, %.0f ms\n", mode, early_start, no_retry,
	       abort_drain, next, naus, frames, src_changes, aborted, drc_seen, empty_last, errors,
	       early_ret == 1 ? 0 : early_ret, retry_ret == 1 ? 0 : retry_ret, epipe, eos_early, eos_end, (now() - t0) * 1000);
	return frames ? 0 : 1;
}

--===============1676936801974189972==--
