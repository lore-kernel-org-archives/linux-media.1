Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295EC3B5837;
	Fri,  3 Jul 2026 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072509; cv=none; b=Q7U2riRsZpRA4TW+YevLSZ4+hmmxqZmIb6+lNjhSOO8oLcuZ5QKx2MB4V2UpdZ9/QTH9ty7lanvtOyXhA3JZIGGmSnPyA/+HktFgPYXoLjFb0g8b0cY4nV2LUaSqPDsVeDc6LqAEk3ZFCdF6c/r2iAtd2Nk98ty0/g3v4bQLE5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072509; c=relaxed/simple;
	bh=Vh7rhfesmmXwRURP8M77yTVUe7E8m4Jtxf2SLlu1j58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsmqyJsr9vDWeS2GX14SagbSNgk6weUKonMDs9HWsAe4Nlq1TV1wlHyITmqoo75At12DbgF8NKtb92Ljwb3oMbEVJHqKyCw601louQNYq27f9pHXqEMU6gT5pDoZ5sF4pUmo+ffc3iaATWyKGqb7/5RQZ+c+wzta2+lME8CsRQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PXyGxHeo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PXyGxHeo"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:8a87:d565:effa:ccf8:a720])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A400F1121;
	Fri,  3 Jul 2026 11:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783072449;
	bh=Vh7rhfesmmXwRURP8M77yTVUe7E8m4Jtxf2SLlu1j58=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PXyGxHeoP6LSeKnUvHHY7P5oSxjS7HSO/oX7Jb7tPu3HOClhgJhDSlkRyWBcUCPWh
	 t/B/yf4Qt4IXQRcr4dwkq4tHLBqMf+KdwGyYJBPZedQbcfU6uwsulis0FioESJcNyC
	 suOFI6M/vulkkUll4UUWxyYBXpOmrqAg5K0GPjgs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 03 Jul 2026 15:24:09 +0530
Subject: [PATCH RFC 04/10] media: uapi: v4l2-ctrls: Add CFA_PATTERN_MONO
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-imx678-meta-v1-4-7c4924a0df05@ideasonboard.com>
References: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
In-Reply-To: <20260703-imx678-meta-v1-0-7c4924a0df05@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Lachlan Michael <Lachlan.Michael@sony.com>, 
 Ryuichi Tadano <Ryuichi.Tadano@sony.com>, 
 Kengo Hayasaka <Kengo.Hayasaka@sony.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=940;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Vh7rhfesmmXwRURP8M77yTVUe7E8m4Jtxf2SLlu1j58=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqR4bNkzirLlRNbXVLsJsi+MlZvCiAZykvwbATL
 /x2UmpspNaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCakeGzQAKCRBD3pH5JJpx
 RaaVEACH/ZuMkNR+TniZjn8Cxm5vJTHxmFu0EqtGhT/Bn8RI+4ufsGrzIdzhXqjkkSJnR6E/XL3
 ZITZoIOdnlN9O91TiTNr2HVrBu4fb+XaF6leVR+ZPhy+Ww/PPE7uzu455aICMJ5HR8Q8DZ2+PsH
 r1lHEy/Ta/WTZoYaLqcZal3pMwcW7CKohK3dlczxBHKH9Q+o5Dr19UNJZxNKv18DBFL2bYw3/Js
 GWCK/asRbN1cWRKO+wxWAUSBe/AsQrZNnLu+EzWdJ4g/o+cdCEk10f+wWZdmWHzZo1teJ07MHNk
 da9PURJqMu2l9eJhS9HPvxgd0ZLnLff0OeVH5zyO92zdxrSV9X6Sa9hxtQ2sIyKXqD+FLGP9NLX
 /JUzpl/o8U3TwpOWYXSsQdVdp6rndzEEdLtWY8WXTOgGRWTstMUZMdKXgX8q0CkzZLddFU6dqos
 817GtSuFMHCaSD/gBLRICr0mRr/9PImc/y1Wmy6C0fYXkqR/Gx5TKkneWSVkjp38Yn2ZNnGtE+V
 3I/47dHozjrXWuqwMwhjL1L/4iXqmWaFNU810ChP5F/srCpvYXIUXxd+KHAXRw4UBJPig1f2khz
 EChfVzykqa0lNyZhKWMaMsdwd7aPex685mR0UR6g3VXQAqMFE8ZxIAPF+MfAl6sxVgIN7+n87a2
 oNw/pbZgGiMuh2g==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The V4L2_CID_CFA_PATTERN control is used to describe the color filter
pattern on bayer sensors. Add a new CFA_PATTERN_MONO option here to
simplify application logic using the new common raw sensor model with
monochrome sensors.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/uapi/linux/v4l2-controls.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a1de5d37499b..10b836ca938b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1242,6 +1242,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CFA_PATTERN_RGGB			1U
 #define V4L2_CFA_PATTERN_BGGR			2U
 #define V4L2_CFA_PATTERN_GBRG			3U
+#define V4L2_CFA_PATTERN_MONO			4U
 
 #define V4L2_CID_CFA_PATTERN_FLIP		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
 #define V4L2_CFA_PATTERN_FLIP_HORIZONTAL	(1U << 0)

-- 
2.54.0

