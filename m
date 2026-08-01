Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B9B35676A;
	Sat,  1 Aug 2026 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785607471; cv=none; b=nX1NZafqzEK4bz2BHt4/n0H234dWY7I2ijDqNfiOuRH9vPTNf3e5zJU+jdyxX9JS6i2D9sP2IXqyeKOxglchfNMnoNupKdLmO18aQucADXdhNYXY2AGJF+vqpvcEwI1ze/FzXcXKre4ExgbNtUxpP9ySh0JEfGydUBtBhbwlZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785607471; c=relaxed/simple;
	bh=wUFjMxZkM00yDQsHIHiPEzkBTjXS+1JEf5fQSLRBvOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMVasqv82tLMkyV7W0UD5hMfPaGhbD2PccOQ25N44Qcn4mNwSLVT/Laq+R8a8glFR49LUql666xK1zg5ktdkQV9oRPA8tv25K4F7+MRPxVq1Rz886P2FJPz1VJAgK7TksS1wPUD43DO/tukoc3grR4dnrP1pi7jePrjvWYF7VUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rxy8sHFg; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=mCp9kqCN; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rxy8sHFg";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="mCp9kqCN"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785607462; bh=wdwehbLSe3/lVlYwz+y3/mZ
	tKNKtiw++rjLXyScvDJI=; b=rxy8sHFgfwLSV/LHmCvwDmf5ncv/moq9HDhLUPgrQQwKsmP2JR
	BKrejXK1JRctekK0ZCLowDwh4avfYrRfiOKfcqCiTQuK2BwG9r1B2bCSiwvx1fTNUqvC/b5Gpdq
	ypNWYfuu0snLfljSD2iJ75fSvZAj52YGqIrHYxLCRuGRFvAPXnS9INLADSyGbUUmgY35Cr/C15F
	pxUdHkfR1aBSV0lDG59SVNGSjNPYfxqh9cxjnRdbeVCPTIbP+CthUHw9N3So4GCSMI7dobGR5AG
	cf9M4q3xaxHGdNx+rkQdTWfR9hFTgI3q5LO/ya3flNDcyi9EvEzkXrSlSdYmPLQ7fEg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1785607462; bh=wdwehbLSe3/lVlYwz+y3/mZ
	tKNKtiw++rjLXyScvDJI=; b=mCp9kqCNLOVkO7FyAMsi/iBqjKhb4FlR+dehXoFlRUs27dQ6s2
	MqAeSFvp5zOd1XhbP0EPKMeh4SXPOe9x/BAg==;
From: Danila Tikhonov <danila@mainlining.org>
Date: Sat, 01 Aug 2026 21:04:15 +0300
Subject: [PATCH RFT 2/3] media: i2c: dw9719: Add DW9800W support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-dw9800w-clean-v1-2-38978de67963@mainlining.org>
References: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
In-Reply-To: <20260801-dw9800w-clean-v1-0-38978de67963@mainlining.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Eugene Lepshy <fekz115@gmail.com>, 
 Vasiliy Doylov <neko@altlinux.org>, Achill Gilgenast <achill@achill.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Danila Tikhonov <danila@mainlining.org>
X-Mailer: b4 0.15.2

The DW9800W uses the same chip ID and register layout as the DW9800K,
but requires different default VCM frequency value.

Add a separate device match entry for the DW9800W and validate the
common chip ID. Use the matched variant to select the appropriate
default values.

Tested on the Nothing Phone (1) smartphone.

Signed-off-by: Danila Tikhonov <danila@mainlining.org>
---
 drivers/media/i2c/dw9719.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd67c..bb9319fc350b 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -44,6 +44,7 @@
 
 #define DW9719_INFO			CCI_REG8(0)
 #define DW9719_ID			0xF1
+#define DW9800_ID			0xF2
 #define DW9761_ID			0xF4
 
 #define DW9719_CONTROL			CCI_REG8(2)
@@ -72,6 +73,8 @@
 #define DW9800K_MODE_SAC_SHIFT		6
 #define DW9800K_DEFAULT_VCM_FREQ		0x10
 
+#define DW9800W_DEFAULT_VCM_FREQ	0x60
+
 #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
 
 enum dw9719_model {
@@ -79,6 +82,7 @@ enum dw9719_model {
 	DW9719,
 	DW9761,
 	DW9800K,
+	DW9800W,
 };
 
 struct dw9719_device {
@@ -140,10 +144,6 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9718S_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9718S_DEFAULT_VCM_FREQ;
 			goto props;
-		case DW9800K:
-			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
-			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
-			goto props;
 		default:
 			break;
 		}
@@ -159,6 +159,21 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 			dw9719->sac_mode = DW9719_DEFAULT_SAC;
 			dw9719->vcm_freq = DW9719_DEFAULT_VCM_FREQ;
 			break;
+		case DW9800_ID:
+			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
+			switch (dw9719->model) {
+			case DW9800K:
+				dw9719->model = DW9800K;
+				dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
+				break;
+			case DW9800W:
+				dw9719->model = DW9800W;
+				dw9719->vcm_freq = DW9800W_DEFAULT_VCM_FREQ;
+				break;
+			default:
+				return -ENODEV;
+			}
+			break;
 		case DW9761_ID:
 			dw9719->model = DW9761;
 			dw9719->mode_low_bits = 0x01;
@@ -189,6 +204,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 
 	switch (dw9719->model) {
 	case DW9800K:
+	case DW9800W:
 		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
 		cci_write(dw9719->regmap, DW9719_MODE,
 			  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);
@@ -453,6 +469,7 @@ static const struct of_device_id dw9719_of_table[] = {
 	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
 	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
 	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
+	{ .compatible = "dongwoon,dw9800w", .data = (const void *)DW9800W },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dw9719_of_table);

-- 
2.55.0

