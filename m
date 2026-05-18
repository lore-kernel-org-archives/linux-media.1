Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76C3E835B;
	Mon, 18 May 2026 10:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100084; cv=none; b=Zl3UBUopHZgsgP3aLMLciTH0i65wdLIg+HEbeaHc6Jn7haOWWbZEqwC8QDaKVnDl5ZFD7oXPZK3izj7egoGLAzKlNnGVOTrqKfsfjUT/xXKiDbMtf9AUHMsK9iAIlnOghzMtiK8V2g+igODcZ1IQ7OzYF7ZJ14vriS5QW/fGdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100084; c=relaxed/simple;
	bh=rOPLs8ziQTXtf4yGzefCGTBcEtcsiUtr3cFFKYF7g8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSPPIHjlauYNoychdQ2mu7x+Dndk+7S6zwG5by9avMEf08/3NhtA/EXykyKKhwdcDLLSyvFq6XqeaevBPFPA/9J7e4czIgtRuKf6wckoLgUqfOpBsqcITt9MvNMc33zJ/cKhd1uVV+yjra+6jN3fhASvvxesyywV6U6rMURalBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5F3001F8004A;
	Mon, 18 May 2026 10:27:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id D4E0CB4080D; Mon, 18 May 2026 10:27:52 +0000 (UTC)
X-Spam-Level: *
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id A3E79B407F2;
	Mon, 18 May 2026 10:24:54 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 05/16] media: v4l2-common: Fix NV15_4L4 format info block height
Date: Mon, 18 May 2026 12:24:40 +0200
Message-ID: <20260518102451.417971-6-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NV15_4L4 format is specified as a 4x4 format, not 4x1.
In addition the block size should not take subsampling in account,
so specify it as 4x4 for both luma and chroma.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..77a0daa92c2b 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -309,7 +309,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV15_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
-		  .block_w = { 4, 2, 0, 0 }, .block_h = { 1, 1, 0, 0 }},
+		  .block_w = { 4, 4, 0, 0 }, .block_h = { 4, 4, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_P010_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 
 		/* YUV planar formats, non contiguous variant */
-- 
2.54.0

