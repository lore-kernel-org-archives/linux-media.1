Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795106688;
	b=oYJ1k2iu8qYrNMpPiulFjHUYLalgd9ApkMLryk6q8mzcKE1r9m+fO0p26rw2c+MF9AbM
	 kfNBC62e2fL1lkD6nHDJz0mzvaChiPewgkPrLRS1sKKlHdzEElq6SrjKOngdujEHwzaVU
	 e1DcIGO26BCHmfMU/0P3scw7WD5kxx1hzhNpDCjSIWD5/jvEmhiuNF9HgY7PPwMLLfMo7
	 6oFH0zG8yST3CxUbXI0jvrHW80QhBVEcGZtIf3cePK++l3y1pG4HzzJz6qVJWGWcJgCcy
	 CfswFofN9h3eoaLqh3bf6Wmn5xZfFVjsdw+OPnAYgXhW+lpxZjXUTg6PpuJ9l52zapQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106688;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OQYPX5ke6jHGW8CXt7YYxw6iTGE5INKleOthwOYbmF4=;
	b=OfsdflwXN5y7xZ0Q6pmvzb6wzp41oho6pn5Vp1gPBtIdOPewrIwIwAUw7OYXAfAiEdW6
	 AWIzgu7DbNjNzjT3uZCmgaf6mfqK6QnFVHvoTdfH8ix8Tonb4GOwB/R3X/waFKnO+uqym
	 fQtTV+l0qeBY10xY+QslcWaxWQ2a9v8I7wxAq2lXi8jb5nYIXc6vnObu6r/rX9SrKz8WM
	 yXYFv5OHn1CKFKtzeQ+hNPrfqpB3bZI+mkOr1C2rVD0IUZoY7faufA0PSm3wscZxGMOPK
	 u+Pa/jrmud4WHqnORWjsfwBc5OHsUnvtU/1E9Roto4pMjH0d2Daj6bGtYb1qLlgvbog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhOZCS6u;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D41606A333
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhOZCS6u
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795106687;
	b=KubOkikBezL56kaendCYholQ3kxXLf38FYVJveoBodJBnqXYWBDQRhFaAdJCaxHtSdTU
	 /sED1rMNx7Q2mXXOOtywwlRwyYYJdk4+Ios4XoHfb6fGATflg9GbqyRWjIBMkFgPcmBBU
	 E6R1iy4Z6tLhi+WEkJQM33DnUOTuObcrF54xUJIhx0sU6K3pKChv982cQMH3aX8h3vtb9
	 FF+KZsJYjsPF9ZukRWj+W4MVDZ365VVa7qNgCO1d1O8qnpEJE4MHDDxMUquh/zToAzofo
	 MuvJJ7q8eIN7EFNhv6RjfRVy/ovsbUM/NrQq43NEOIEsMcc/v5VF+4rWAtPGWywv/iQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795106687;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OQYPX5ke6jHGW8CXt7YYxw6iTGE5INKleOthwOYbmF4=;
	b=jaAStYRfddHga7nhkpA5YNflCe4GrABetRzlW3tGWuBnlE/K1bIYEbLAim4P3i/5uyem
	 Ntm/jdyvOj9+dpWmczS0O3iTeMIq0Ss4+K761xnXqQoUojV6O+6bc68y3vBR0C3WXV9ax
	 u7Db3fZH+OlWnFIR3xfFPDxD2ND5Y/HjIIAFfsiHr8Mm/6DvRJTQb5sPBheXKLL7rU1Zw
	 Mle9LllfEYPGFqtdLYSx+2wHHvTNzRIe/TFOl4GIp0rAn+v4e4InKwwP3hgfy0UvvD+Wx
	 lj7Z14k3XYFdlqsxRvEATGcpvlhTTPzobCI9+/ykC9TG+ePejoRaJPaPj8I/ISxOApA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 308BF1F000C7;
	Thu, 19 Nov 2026 16:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106687;
	bh=OQYPX5ke6jHGW8CXt7YYxw6iTGE5INKleOthwOYbmF4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=bhOZCS6ukxmcuIOtnBI4MnS1wRKIOpiYQ+69pNQB1X2NY3Eaq8NpXzKSoBYzOPtZG
	 +mUwDqQTdqY9Kw15F7PMvwdWrh9mraB1eCPHhm0i1osoEDe4nJuLNdT+rsgcw6zhON
	 4oJbuUXebUc72dAaK7dbHwk1WjgKMkDN31Q2m4Bnsah8EXw/jjd1lOTq6Unr9ckuqZ
	 EdjUNLzYZCQlEzbeXK2p/KH0P20deVLT5NPyR79eeaEuoPM2T9Wzy2agJFZT96/0FP
	 VNkw9cOH0ZJ8Et1Y5xeN1kD2BxA6rIuyVOnWaEOkJwjmRpIIesWApDHrtGITU/nz21
	 Inb1PCBbSlVgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8268E4B348;
	Thu, 19 Nov 2026 16:44:46 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 16:44:46 +0000
Subject: [PATCH RFC v4l-utils] v4l2-compliance: detect
 V4L2_PIX_FMT_MPEG1_SLICE decoders
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261119-v4l-utils-mpeg1-slice-v1-1-204ec6ef9166@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NL3TKTHN3SksycYt3cgtR0Q93inMzkVF3zJEuDNHNjA5NEixQloN6
 CotS0zAqwudFKQW7OIDG4TqVYiIri0qSs1OQSkPFKtbUAcuFIoIsAAAA=
X-Change-ID: 20261119-v4l-utils-mpeg1-slice-7b90f7304a8d
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795106686; l=3935;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=3DdqQ3KNlKglmIG7Q1VxCQYz+FeFKYbpbQNmL/+qqag=;
 b=h/SGZskaAHxRm1UZmHho4noMYeAX3sK6hWx2K3uGfPOAcn/JbMsERaBHrzPfJY1IkqAlBDSMW
 SyTOf6R7g0rAjjawD3x3lngpgMX7JJ/CV1gnBK/AGSZFfmN+cMTGlkG
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

determine_codec_mask() gives up on a compressed format it does not
know, so a decoder that lists 'MG1S' is not tested as a stateless
decoder and fails VIDIOC_(TRY_)DECODER_CMD.

The format and flags are added to the headers and v4l2-pix-formats.h
by hand; sync-with-kernel replaces them once the kernel series is in.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
For the kernel RFC "media: stateless MPEG-1 decoding, cedrus support":
https://lore.kernel.org/r/20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com

Tested with it on an Orange Pi Zero2 (cedrus): 49 of 49 tests pass.
Developed with Claude (Anthropic) as a coding assistant; I reviewed and
tested it.
---
 include/linux/v4l2-controls.h             | 3 +++
 include/linux/videodev2.h                 | 1 +
 utils/common/v4l2-pix-formats.h           | 1 +
 utils/v4l2-compliance/v4l2-compliance.cpp | 1 +
 4 files changed, 6 insertions(+)

diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
index 80d0e12e..8108f0ea 100644
--- a/include/linux/v4l2-controls.h
+++ b/include/linux/v4l2-controls.h
@@ -1986,6 +1986,7 @@ struct v4l2_ctrl_vp8_frame {
 /* Stateless MPEG-2 controls */
 
 #define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE	0x01
+#define V4L2_MPEG2_SEQ_FLAG_MPEG1	0x02
 
 #define V4L2_CID_STATELESS_MPEG2_SEQUENCE (V4L2_CID_CODEC_STATELESS_BASE+220)
 /**
@@ -2034,6 +2035,8 @@ struct v4l2_ctrl_mpeg2_sequence {
 #define V4L2_MPEG2_PIC_FLAG_ALT_SCAN			0x0020
 #define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST		0x0040
 #define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE			0x0080
+#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD		0x0100
+#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD		0x0200
 
 #define V4L2_CID_STATELESS_MPEG2_PICTURE (V4L2_CID_CODEC_STATELESS_BASE+221)
 /**
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index feb32668..d027e134 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -734,6 +734,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_MPEG1    v4l2_fourcc('M', 'P', 'G', '1') /* MPEG-1 ES     */
 #define V4L2_PIX_FMT_MPEG2    v4l2_fourcc('M', 'P', 'G', '2') /* MPEG-2 ES     */
 #define V4L2_PIX_FMT_MPEG2_SLICE v4l2_fourcc('M', 'G', '2', 'S') /* MPEG-2 parsed slice data */
+#define V4L2_PIX_FMT_MPEG1_SLICE v4l2_fourcc('M', 'G', '1', 'S') /* MPEG-1 parsed slice data */
 #define V4L2_PIX_FMT_MPEG4    v4l2_fourcc('M', 'P', 'G', '4') /* MPEG-4 part 2 ES */
 #define V4L2_PIX_FMT_XVID     v4l2_fourcc('X', 'V', 'I', 'D') /* Xvid           */
 #define V4L2_PIX_FMT_VC1_ANNEX_G v4l2_fourcc('V', 'C', '1', 'G') /* SMPTE 421M Annex G compliant stream */
diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-formats.h
index efc31d73..e34c9ae1 100644
--- a/utils/common/v4l2-pix-formats.h
+++ b/utils/common/v4l2-pix-formats.h
@@ -223,6 +223,7 @@
 	case V4L2_PIX_FMT_H263: return "H.263";
 	case V4L2_PIX_FMT_MPEG1: return "MPEG-1 ES";
 	case V4L2_PIX_FMT_MPEG2: return "MPEG-2 ES";
+	case V4L2_PIX_FMT_MPEG1_SLICE: return "MPEG-1 Parsed Slice Data";
 	case V4L2_PIX_FMT_MPEG2_SLICE: return "MPEG-2 Parsed Slice Data";
 	case V4L2_PIX_FMT_MPEG4: return "MPEG-4 Part 2 ES";
 	case V4L2_PIX_FMT_XVID: return "Xvid";
diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
index e9e84363..f31b7ed5 100644
--- a/utils/v4l2-compliance/v4l2-compliance.cpp
+++ b/utils/v4l2-compliance/v4l2-compliance.cpp
@@ -604,6 +604,7 @@ static void determine_codec_mask(struct node &node)
 			case V4L2_PIX_FMT_FWHT:
 				mask |= STATEFUL_DECODER;
 				break;
+			case V4L2_PIX_FMT_MPEG1_SLICE:
 			case V4L2_PIX_FMT_MPEG2_SLICE:
 			case V4L2_PIX_FMT_H264_SLICE:
 			case V4L2_PIX_FMT_HEVC_SLICE:

---
base-commit: d2e89246cefcb6371425361b12c4ca2a36a662d2
change-id: 20261119-v4l-utils-mpeg1-slice-7b90f7304a8d

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>


