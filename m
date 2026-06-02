Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A059C39936D
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 22:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780439709; cv=none; b=lmvPR905Kqm6L/DM1kOyjKlwDKPHmTINA3Yfg40FkLyUB/fwrlNHQ/xb7fenZMOpMKk0ilzQWVW+hMH6/Dsh8FetfDD2OEMhmYquHPfP2kwc7AoOnmYEx+44Rn5rWrrwbR0kj18Whj5gTvWrArjBZ3HfMuYraJcQcOmLwAPE2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780439709; c=relaxed/simple;
	bh=ymtXsJ3XBwX8VsD4dkmcTHJ9luGsKlGWzHGma50Ig94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JfMNP6PPcMAPYarorlkgE1Sz79jI74611ZU6nhVhJTetwtUwA7zgTPkJCt5MCY6Kx26VsffpvYo/yDzW9qZntSiYgSvmObKqRAYYR83qL7Y5or/Er/FRLJDCCuCxeVihV8qAzsvJOu2xsAtFMUWDvH9knbOE8AUQ1lrPpyxvsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W8k35kwy; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W8k35kwy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780439695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZxHtGUK7BeQdI2Ot+q2RAaa+eQBvtlH57aM0BhhPgFo=;
	b=W8k35kwycNd+Iub3MF/6Dnx8KXW+/GG525invA/5VEmi1i6jg8fPjneKoM1lOw8CKfEP3I
	BnewOU8dRBAFLCPdCGiMYxw4JAGXRi55S1sD2qnAWIEqFHpjIacqfCVBbcPEmpzT9PNKJ6
	Fbwx8bkaptjRVpnTLpka4Vz3GawGQD0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] media: i2c: isl7998x: inline i2c_check_functionality check
Date: Wed,  3 Jun 2026 00:34:43 +0200
Message-ID: <20260602223441.1087427-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=thorsten.blum@linux.dev; h=from:subject; bh=ymtXsJ3XBwX8VsD4dkmcTHJ9luGsKlGWzHGma50Ig94=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnyUY2HJV6IbdX1+scbf/pP8RrRi8wlO1iPxuy6NqGwZ Sard5dfRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAExEKYmRYc3O7bZXt2TPfhv8 JaVhbWT3i/nB/9+xJWhfi1kzOfic7iSGP/yh9akRX99Fim+V0j5zentn1XWPezuSnx5Imp694TT TRT4A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Inline the i2c_check_functionality() check, since the function returns a
boolean status rather than an error code.

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/media/i2c/isl7998x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index a77538d2343c..8244d4296a02 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1460,8 +1460,7 @@ static int isl7998x_probe(struct i2c_client *client)
 	int nr_inputs;
 	int ret;
 
-	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA);
-	if (!ret) {
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA)) {
 		dev_warn(&adapter->dev,
 			 "I2C-Adapter doesn't support I2C_FUNC_SMBUS_WORD\n");
 		return -EIO;
