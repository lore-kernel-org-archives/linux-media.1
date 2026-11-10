Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294277;
	b=hJVt0IRa2g1wrvzSpXxIEEbz0lzigoEJbaiSjpRt7DiHFVli26Q1pSwBk51ysXDoF0wT
	 XK9++5tIU8bORINkUqc8yMNHibnFApKlA/qij65WDrBZF8QPF/UIEvgUlRJ7M65lDOhLI
	 cOthDAWgrH0HXA6cM8mok05847bdMax+NU5t4ArEe+1LRGxEB/kbBDN7LfQY14eEBZqqb
	 xMzBapu3Ms6AbNbDSOAwAZVYLcliBu2guRR5/kJIsAkKLIRdenPX3fcyMAnFCbKYm7h0D
	 hrTSHIoMkdJeZGYmAHXjMULFtHdn9pqQiN3E2KGijM7Nl5VHaXBOceY7fecluuxdSoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294277;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID:X-MBO-RS-ID:
	 X-MBO-RS-META;
	bh=Y+Nl6zp8i+WVvTBOqlPP3AitK0/k7JmYWJZVB5ZVk5A=;
	b=AEsmtkzepCPy/eqZl4wzconNV680cSC45xyDdaohBNbgBSLHOMpEmPMwfIMTX4DnvOFE
	 ijzyUUF9jNSGqtqGDjavfa9UjMuoMhB6F3D1V030NOJ4PyFMOmeELzV/u3y/10TdXqlpp
	 gcwfcM9F/E0LDG0GDS/CgzuBwcKNXBFN2LhvnzzjeEUJo0QxAfJUiCK/QUulJGzL8nBUp
	 uF/INATRdiKeJhKBGzhvvyKw5fYgif1XWaIqf3+u6FW+NAqULBM+i/iSo+gPOHn29C3JY
	 balsxpO/Pkg59wEsEocKN52ZC/LuOhvck0YgPwoe+WTDMyTcurK+ZEIPbcm7BLpYC/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Xd6aG4V4;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817D260A2601;
	Tue, 10 Nov 2026 07:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817D260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Xd6aG4V4
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jNyLz554fzKnGf;
	Tue, 10 Nov 2026 08:04:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794294267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y+Nl6zp8i+WVvTBOqlPP3AitK0/k7JmYWJZVB5ZVk5A=;
	b=Xd6aG4V4pZprtNZRb5fVp2NO/gNRX/I3SMWzzXOcu/ZYODDcrrkTcicKQtC/zNfiojqaYn
	82SAPoOAgvOQKwup/s09NlSGsoYPlyanBPW/rcaUry9TpaKkhlxC9iHkV37+3wwC+GxdID
	ArEeXFfd5HGQQ6ShpX8k3pcpQn8pfG6v1y43SnQOGlWYkvwcJnaBjE2eqk5cGwbM6FFEdb
	RPLtU6eCWyC2pXXTQ78zovGYAp+6yLmNzP1mWzCL79RO5U5KlmnlZOSRVHq+Z0+zJ+2XZ/
	GLGh0ZAOCGZbB/ocASB9/RI0M8pX7rZRz0jb05TYWFZGBmPuo5JgPV0jXncggQ==
From: Tobias Hahn <tobiashahn@mailbox.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: iris: HEVC Main10 decoding works on SC8280XP (HFI Gen1) - report
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 08:04:26 +0100
Message-ID: <179429426605.1835940.6806200834634476567@mailbox.org>
X-MBO-RS-ID: 2114c235e10be41e525
X-MBO-RS-META: ddbbofjk5oji6db53ig8xjdjr8a3jdrn

Hi,

this is a report, not a patch submission. Up front: the analysis and
the code changes behind it were produced by an AI assistant (Claude).
I have tested the result on my machine, but I have not reviewed the
code myself and could not defend it in review. I'm sending it because
the finding itself may be useful to you.

Hardware/software:
- Lenovo ThinkPad X13s (SC8280XP), DT compatible
  "qcom,sc8280xp-iris", "qcom,sm8250-venus"
- firmware qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn
  (QC_IMAGE_VERSION_STRING=3D
  video-firmware.1.1-b158087140355883dc40b004032856a8feb5d565,
  linux-firmware 20260916), HFI Gen1
- kernel 7.3.0-rc4 (Arch Linux ARM linux-mainline), iris driver
  unmodified from v7.3-rc4

Finding: with the stock driver, HEVC Main10 streams are rejected in
iris_hfi_gen1_read_changed_params():

  qcom-iris aa00000.video-codec: unsupported content, bit depth: 20002, pic_s=
truct =3D 1

The firmware reports 0x20002 for 10 bit, the value the old venus
driver calls VIDC_BITDEPTH_10. Following what venus does for HFI v6
(venus_helper_get_out_fmts(): DPB hard-coded to
HFI_COLOR_FORMAT_YUV420_TP10_UBWC, P010 on OUTPUT2), a small change to
the gen1 path makes 10-bit decoding work on this machine:

- read_changed_params: treat 0x20002 as BIT_DEPTH_10, set
  fw_caps[BIT_DEPTH] and switch the capture format to P010 (as the
  gen2 path already does), only reject other bit depths
- set_raw_format: in split mode use TP10_UBWC (0xc002) for OUTPUT and
  P010 (0x4003) / TP10_UBWC for OUTPUT2 when the capture format is
  10 bit
- set_format_constraints: stride multiple 256 for P010

Results, decoded through V4L2 with a locally patched FFmpeg
hevc_v4l2m2m (FFmpeg itself needed a small change to accept P010
after the source change event) and compared frame by frame against
FFmpeg's software decoder with the psnr filter:

- 4K (3840x2080) HEVC Main10 HDR10 film: 301/301 frames bit-exact
- 1080p HEVC Main10 (x265): 96/96 frames bit-exact
- 8-bit HEVC and H.264 unchanged, bit-exact
- no new errors in dmesg; real-time 4K playback in mpv at about a
  tenth of the CPU time of software decoding

GStreamer's v4l2h265dec (unmodified) also decodes the 10-bit streams
with the driver change; there I only compared after a P010->I420_10LE
conversion and got ~70 dB PSNR, not bit-exact, which I attribute to
the conversion step.

Not tested: SM8250 (which shares the gen1 code), VP9 Profile 2,
resolution changes mid-stream, interlaced content.

If it helps, I'm happy to send the diff (about 60 lines across
iris_hfi_gen1_response.c, iris_hfi_gen1_command.c and
iris_hfi_gen1_defines.h) - with the caveat above that it is
unreviewed, AI-generated code meant as a pointer rather than for
merging.

Thanks for the driver,
Tobias Hahn
