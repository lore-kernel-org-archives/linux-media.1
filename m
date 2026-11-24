Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539099;
	b=DmR4cEZhfHy42kBucDpuySXf3aFCgplNwIAXp41fL63rLiFDQAP+SVM5Eu3HVsVf60mV
	 0LqJnIi0EMj0dbrG2UfA/Tc8zWR2MKJJUuBytrhBl60aG+VTUBo2LKdl0Uf6huc2LT75z
	 Dj+L91RxDNZnqxTVMHWu2IFJ+xckxNaj+wRTtsLgvYL517CwovmPOWfj25k8i/Cu9GuzV
	 dV5XdPpdUtQPy25JWlYnSL4KUwtfER5yvPy1O4UrwVBOhCgLBEHPCxFu8tBC4m+6G3c+d
	 YX/ISWwCZBTOTF+7HInqQxWaLCpHcIx0XZ6MMkkSFiVqxPQOB4cOAQdDUlrL0RpE+Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539099;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KJavvbuJ6ZzKjUZOeb0DS7L7g5x3JR0aGEP1fXSbWlE=;
	b=pDqFwXEO6/VcfYVwP+GTSoqGftrBG2t2qCpme25noJ7NYFpX1P6xUQtbb84cdaaWVioZ
	 TkNvYXbKqeVsHQ0qj4v85Y3dUDbVPTR8hOlDlsJj74L+XwWv0rGNDua3QQAlPVw9clQA7
	 CzPkEe3W8QIqSoEcDwTirg/ztXm+76rTtpj/Tx6sa6irIkqgk+xIwJs8u3bBiUJbcVAs1
	 6vNQvRamx9MVF6wUDwEWnScpwinFMGakYKpsZJ4tuVM5qSEnwuewYF3xRWPUxiAylGz05
	 cCCp1eJPgsY/Axqo72Xxy9OyvaCmI5y3C7PoNYRldbSlQeo+kMI+jl5LtVaanWQOsnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=fW587c7C;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EAE606A6B7;
	Tue, 24 Nov 2026 16:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EAE606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=fW587c7C
Received: from [192.168.95.178] (mob-5-90-67-29.net.vodafone.it [5.90.67.29])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14361BE1;
	Tue, 24 Nov 2026 17:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795538935;
	bh=sghTd92s+j3KgqccDhPZ8WchHyrpDXD3ox6+7d05Qow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fW587c7C55m2W+GwuS4suB3+roxl86on/QLQllqlanQ4qV6h2MxeDwMI0/sYk9swo
	 YWovw3h/JzsgVdGY8ghEQGTgvu+QFQT1kWcR9VaH+2R6sRIIcNVlA2dfr0lwxXtgVW
	 pxJ0ru9Nncy1/byxrGiLB/ZD3TGvQ0fszjmAoIv0=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 24 Nov 2026 17:51:12 +0100
Subject: [PATCH 2/2] media: mira016: Update 8-bit gain init sequences
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-mira016-fixes-v1-2-20a7be606268@ideasonboard.com>
References: <20261124-mira016-fixes-v1-0-20a7be606268@ideasonboard.com>
In-Reply-To: <20261124-mira016-fixes-v1-0-20a7be606268@ideasonboard.com>
To: Philippe Baetens <philippebaetens@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hans@jjverkuil.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=XiA7K1v9VzlQE1IMHKj4n9vmrzJ7bdm/uX963+sQzRM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBrBcCM7YdCSkAB/j7GFBr3ZKTzbMiQNkzy4rY4R
 7x66S3/PxeJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCawXAjAAKCRByNAaPFqFW
 PLB4EAC773XEZNeMsn1ef0sUlYJKMGMiB7v/urgSTDufwd0KuoJCmMhfJ562OEG2KBipIYKL+7b
 S8+bb2xeXCHX3plIRdIPlqxund4xMIcC7DVJ8x3HWHwvtrKKV5EhBdA1yfwM1BAgyM+n1D/gTNq
 hvZ9V67A4dSOBUt93ELcprby8v0jVxlBwqSFsUtXNt6mhR4ZW/RWzgQg4iS64PDSjvbd2SUFEYz
 RjOe4jZddycK5gvFLQTaUSt/Pccodnv3PqhzNKOG4udlc5T1ECUfJRF+qQT3W2bmZ7rg5LCL4Rp
 g8W2GsnW37j0etQ3QcCxQ72lBa8xg4rAtFmTSwmmrsGERjkZ9i06bX1pbaPMpCGHQ8C4jr4vmFh
 2Bw2vzrxsidS03yqklwEm/r2JgKDigy5a0LAjlDbe3DCgDJt2UuRm8K2dt3P6DPdC5lZhzj4/dH
 qM55NoT5KQFqt/FjHSKImzmDbDDiJlpbUSfUgV5BIcrIzw5WeOntBUImyXpESmiTWmL0g4E8BK1
 2fHydmyzwZT1dBcTUMGLmypB2Q5XxDtdg322FEmswV4vWSfSMGv7wHusj8bFLh6fJqwqD/6qVx4
 FwspdAU3k0Ukdob3+1TeOctyobIIgvZMh9Q9uk+mlLdat0GdL3YpEl+8Kvsh0mKBqrruk+D2JlJ
 x9iyaaOrfnIxNoQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

From: Philippe Baetens <philippebaetens@gmail.com>

Slightly adjust the 8-bits mode gain init sequence.

Register 0xe024 controls the additional digital gain only available in
8-bits mode. Initialize it to the unit 1x value.

Also adjut the 0x005d register that controls the desired black level
pedestal to the 8-bits default value of 0x06.

Signed-off-by: Philippe Baetens <philippebaetens@gmail.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/mira016.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
index cecef53d8af0..a3396b411746 100644
--- a/drivers/media/i2c/mira016.c
+++ b/drivers/media/i2c/mira016.c
@@ -323,10 +323,10 @@ static const struct cci_reg_sequence mira016_8b_fine_gain_init[] = {
 	{ CCI_REG8(0x01f0), 0x24 },
 	{ CCI_REG8(0x01f3), 0x2 },
 	{ CCI_REG8(0xe000), 0x1 },
-	{ CCI_REG8(0xe024), 0x3 },
+	{ CCI_REG8(0xe024), 0xf },
 	{ CCI_REG8(0xe000), 0x0 },
 	{ CCI_REG8(0x005c), 0x0 },
-	{ CCI_REG8(0x005d), 0x18 },
+	{ CCI_REG8(0x005d), 0x6 },
 };
 
 static const struct cci_reg_sequence mira016_10b_fine_gain_init[] = {

-- 
2.56.0

