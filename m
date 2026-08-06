Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF0B30568E;
	Thu,  6 Aug 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021410; cv=none; b=bl3/yJjDt+OSWk6c8v3cVhkrmKEUxeVHevSbSFWELUQC46tVMkPh4zm9rlohfEiysPUyKOt3L6Oh7ZYcGNcPvZ1Cndp9GWYDp7Fa+qSH/554u8UUPSFWuuMosqPSKIdDpi/4BZ6mwqNfgSaSqlMr5Tdj5Y0Wf8QlMSxAN6oIqRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021410; c=relaxed/simple;
	bh=zqI4DUCk5PuwPeZln/BCwbmdF+PMmVaTHiRJuLDZj4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g/djJosAEQFsnWYV4LbdRZekqk9uh1C0b/1Q5m9iS1QQE+pCQanG4ixdTpg6cOTbiRHyBdvn68GQMeIuIE0kX7zqfp5gWHFrsn/OgASRiYsEKU2F/1qrcTkK8E58NB2YAPiNHIyruF3Kxm37B4LBfyxdVs0wmfwyceEq5aGnIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HToXniKS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HToXniKS"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65F38741;
	Thu,  6 Aug 2026 15:02:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786021325;
	bh=zqI4DUCk5PuwPeZln/BCwbmdF+PMmVaTHiRJuLDZj4o=;
	h=From:Date:Subject:To:Cc:From;
	b=HToXniKSE9iIvQK/w5jDdhc8DKV7Fz3I4ZtzSS687il1K44tjCW5TedUD5wdNtMy7
	 q05lfQ3BV9EEx0jtGaOX8sSC5Kx3qS0z0Be5FzXnqM7LcVQVbkouArcYeFblBfrppv
	 mVdsTtGZ5UQj1q4klAG/UQqhgdoNjR1QL/Lf5gHI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 06 Aug 2026 16:02:57 +0300
Subject: [PATCH] media: v4l2-common: add Y12 and YUV24 to
 v4l2_format_info()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-v4l2-format-info-y12-yuv24-v1-1-de2dc061be02@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAACGdGoC/yXMQQ7CIBAAwK80e3YTWAlav2J6oLjoGgUDLbFp+
 ndRj3OZFQpn4QKnboXMVYqk2KB3Hfibi1dGuTQDKbLqqCxW8yAMKT/dhBJDwkUTLnMlg4b21o9
 9r93BQQtemYO8f/l5+LvM45399B1h2z6Dee6tfgAAAA==
X-Change-ID: 20260806-v4l2-format-info-y12-yuv24-4236cb991a7a
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vishal Sagar <vishal.sagar@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=zqI4DUCk5PuwPeZln/BCwbmdF+PMmVaTHiRJuLDZj4o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqdIYQtkyTQK9gZxz7a/EoIX4A0y2iDUeBANZZ2
 Wu/h4WA9uGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCanSGEAAKCRD6PaqMvJYe
 9VUXEACNee18prB3V4GspDkrRHpoPqfkvO8zFbqKOkK3lhXTl9u9C4oOKL2LSqBMrWP9QNwPIUl
 R14aoNQqnSE0RYLl3uhHJm9lVEkcodXkLZEUXdzu5ZJWKanQghgVQwKs+gnF+7rZs8pINhAzQPo
 1tOGX2vqoCunryOVK4T1oz32+ARsWPOSnCrgaWu7hv/epI0QVi4IISYqFFI7tTHqeHLwscMIJEe
 ra97RQTl6sQD9d0p0YfwsjRG/5ykZJy6HhA05cmKIAFDoldstwZ0S4QHXf3P+tT62PnLJOPzxSl
 CSAaqdDTCa51PjbAoaa10ZUqi9ExhIUyDlH6juy+DQJvPgEceQ00oyyLmw1BFk8SfSvxhehHas0
 LybtgCLb/yEmbvhmzcOzMU6RGD1MKfUG38TTISCnVDTYy3Y2q7zqkzEzv8ZK/M3CILy3Orm8rR5
 CHZ1ygWpsml5uMp6iw2MS93QZ4ijFunfAitg94tZR+7FGKYC0ll59cJ0L5dH3hMdFZjDQVopG+A
 1uxS8ybos7mOtwfcV3fH6pN1inarOaqCx/SizhDpzaKSA3g6fzKNrykX/FJ60mXccIKMgYiSVQY
 YUFfcD9zCebUcAeaM4R3yeAQ5h+Wfqt0DvFMimbTb8NCngzVQ1hKCkfT/aRtL1r5UeZw1kKJyrf
 v3UofejmIFRsTGQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the V4L2_PIX_FMT_Y12 (12-bit greyscale stored in 16 bit container)
and V4L2_PIX_FMT_YUV24 (packed 24 bpp YUV 4:4:4) entries to the
v4l2_format_info table.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad38..0951a1b42a5f 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -307,6 +307,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_Y210,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y212,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_Y216,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV48_12, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 6, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_YUV24,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_MT2110T, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
@@ -333,6 +334,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_Y12,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },

---
base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
change-id: 20260806-v4l2-format-info-y12-yuv24-4236cb991a7a

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

