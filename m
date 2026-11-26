Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712462;
	b=LahwrhLZqS4scPRlt/Qj9TPkUAXnB1DEGwFmRQJmrcl7xXKDmAc0RiulTgHwnMe4yl/P
	 DP3T/X9jlsEL/nLGLhBhY1yRlNw70QK2pK8I/prsvAu9T30JhJ9fkLahbIRjA9S+Kc545
	 79MdjZ5tGO+/s2u7OAx2exV+K+0US/JPQWVgsDzR7St1AI/gBkKOu05mvaXjhI75jJVhD
	 +MOORyn4R+u5Ruf4wrOJByQG8zbPvZbH4vhRWAalw2GX5LhytLtQIP2RwvSr7R1fgAbvo
	 IlABbZIJJfYDzueiscxE/02W+7XegojjUVerP+0xA/gPV7EoTeIvDeViQKZ/6DU4Ltw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712462;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=n51tRsSR1uv4ce5V1bvi8pKtqFtfK02ZhkRTz+VN5TU=;
	b=vZNvLiFMzkVHedjXRTMKPPst8uOQ4fvQCjEXWFOyCpiSp29K0iSV+GFjweS6BYd+C9hc
	 t7qoacyKtdCD+2O07Gjx31Hw/ost5W4qui3l5uy8fh8p3JTOd/J3phbxUdxUIFfH4ONAR
	 bqTXJ1cwFOxe9diSv90/UKWj2Fe44Ob+om5iotOyptwSoXXB2qf3uqZr9oBIqzpV4apgs
	 tlGPE+7hsmX7dIKrX5+7qkY+0dwu1C+6IzmQ1SNkmGKmVDkYlHqxbs4XrtX+RRIiV4Oh1
	 tErk8hpNbzluztDYZTMcgqMxZ2O4v1RM5UBCcdo0O2PwzsXvZOlbT9s1R7YhUe709RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFUosOlt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB1B606A31E;
	Thu, 26 Nov 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFUosOlt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712462;
	b=kQNR8UhkHKEhzRavm4oI6GSItwtkRSAFs9Rhz4eDSWRCxPR7Nb+kc0KlqosXi54s0S7e
	 Dz2SEEvbgz0gEsp+UQS5gnIp4iIbuAtUZPbGtASvxzxIZ5JxcbWRXmdXT3mfw06RuaGF0
	 xlFamz4LgHqC7NxDUhrs7OcShWPT9hiVTxzFfHI8SEGwHVG3v+lfRteFN9XslNoten1Ur
	 YwIsXQNfRagZWXgSnz9Yd9UugSQVrvgUVqlG+WKzhmHcud6NQwYQ9CmppFbe/YtX5Ja6d
	 pLOd1cJe1sx9OtxsM5yd1H9f+/m21iphTfSd/GGx+qma0kqIZZWx+fKQ0i5PFA4hpcg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712462;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=n51tRsSR1uv4ce5V1bvi8pKtqFtfK02ZhkRTz+VN5TU=;
	b=wActME7RlSpROiTA9FvZYnf6udKq/O0JvV7KnvjzA3xrnIcogLdlkm9LI2u0xYXTRE/2
	 aUXuMsAG62kohSJk8ldHvk3RZwM8DL7n7limfXJ8V31xpQqsppw6RZqmkSPWVA9bnTiTK
	 xrutRYNtVfjqOdhFKsuiic0iwXvDYZ2q1MvUU978yuMQc5ISV2m6tilbtNC2+Skj4bmNR
	 3KUCbZQU9RlRYtejxScUTOu/vWnYfGJlxClOAHOYawz+cK8rLaelzvciRDR8D0txoscMd
	 taHTpjhGujvrw+79KTr65NFL37Ykfqx6fgVJ1DXIidffRJM96u+bytSFFx83xBv+wNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C1A41F000D4;
	Thu, 26 Nov 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712462;
	bh=n51tRsSR1uv4ce5V1bvi8pKtqFtfK02ZhkRTz+VN5TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aFUosOltN0N3sS9lbhVGvad2KurYAe6SrVlIH1C1LcdjUoob3pqD0FPkAx5uFzfZ4
	 D/FMn+kry3SlTe4WaxhYYHr6/ABMukj5lEjmsbmsSqUSa6y3nnAJFM9VPPan5+zcFU
	 2Phk4CAV+TFdoReRSq51oeqBGKo87+B3RtaQmmDHVvxnm1SyboXqAY63Y9W2Wd/TiV
	 8JM4css8n51UrDC/dvTTU/w6T/D25eXV02N9n7fteCu7sy5khdx/o77cwwT9u3d66z
	 lUgUz7t9VHom39NSwVLGzA04gVnAZN55iim1HqFtNxkqttOF+ejWYGvLxuePrW326d
	 8d7pvbaowmnOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E1E534D75B;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:00:57 +0000
Subject: [PATCH v3 5/5] media: verisilicon: rockchip: Limit the JPEG
 encoder to 8176x8176
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
Message-Id: <20261126-hantro-jpeg-enc-fixes-v3-5-07357d84a64b@gmail.com>
References: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
In-Reply-To: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712452; l=1336;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Ov3GnRRy9PGD1C66aiFxQPkVwaFypntQvwUeWFjwO4M=;
 b=4zCWrSusBdi/YNvGLj4TcvK+ryXPUWYhee6coY44Tddp6uv3l9Pn7/UgsfTYaqYX7oIZMcVzY
 uUANa/519+nBeuhjtcGEb6b9NgxTHX5AAYByreDRTCoFaq2NEhPlcOd
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

The VEPU2 and H1 JPEG encoders take the picture size in 9-bit
macroblock counts: 8192 pixels is programmed as 0 on VEPU2 and runs
into the width field on H1. Limit both dimensions to 511 macroblocks.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..d295e9571a8e 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -20,6 +20,9 @@
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
+/* 9-bit macroblock counts */
+#define ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE (511 * MB_DIM)
+
 /*
  * Supported formats.
  */
@@ -52,10 +55,10 @@ static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
 		.header_size = JPEG_HEADER_SIZE,
 		.frmsize = {
 			.min_width = 96,
-			.max_width = 8192,
+			.max_width = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_width = MB_DIM,
 			.min_height = 32,
-			.max_height = 8192,
+			.max_height = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_height = MB_DIM,
 		},
 	},

-- 
2.55.0


