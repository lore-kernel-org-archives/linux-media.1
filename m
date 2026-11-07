Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013326;
	b=VVxeijGwMrWhi1DoZnyXglqFRG9HpCAiarmcz7uZljcBU4/PpOunyfjWn2vWw5cbSRw5
	 sVPVNzEXr/rBKohxn1dJg02b46IkOar2krZcjWb+71Rkn5HWPmhZJOxH7s57m4XTaQvqp
	 ram/J4g2k8FQyg/lpUlnbC2MftBsFgbVaw4ube6N0t/J0neUiH6jIsetSqAtkpddQR7nT
	 8aueiS+XmWQ3WEK4jGmytW3/g8Z82LnrLX3SNVrk8eZO+dr77Q/0xePHPTiayROpYCBo0
	 IGOBBR5Y7lpej7h/3z0j2MyXLzDuNV4qm1gFZsECPbS1fmLVLZX8pKHaDAWfPEN2YTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
	b=QkSRGHIRb3LzaSjWW/+PJiDBcx1fO1ebvaQMr837DeYyoycAF2ECDXGjraRFkx9TgRSq
	 XO6/sBDxLhhAFOMk+1sjvu82haAcJTPKfQBJK3EwTVSC018ctxk3mG4e4wvFqXCICIQTV
	 j66Ou4/8alcMw9zxh/ZnGADjYZlbtwRgwj4cDCoD/IZpPbPGja8IHEqV/hOfb+X2lZEo3
	 1bkyBiGlPVekjaWwvpvPgLUmYEJ8yx4z3iaCgQTEC2Jvk6HkAyPdO+DvQ5SCK2gVYgS7d
	 KhzvDGzZVjlCF759MpcnQBGgrCPLdDtpiHeI7jMU+odhraxV71slD+7npAU7b9nKxtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HUJAVbfA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337416082BC1
	for <linux-media@vger.kernel.org>; Sat,  7 Nov 2026 01:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 337416082BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HUJAVbfA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso10678005e9.2
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 17:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013325; x=1794618125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
        b=HUJAVbfAXgHnnfOkKEqfhXt7eOqE/3lxwihUWmgBgG+QO2xO3Fb3L00X3zIy6iGr+P
         fBCcYkwhfRxizQUPDVM+v1TTjarkWPtRoA/uHniB3oRuhcJ9Z2G+TpoZGSh2DdWscIqI
         O1Kwa9W32sC/mcHITA3jTUcie3AShYLY3WraKRGogb3b4TCpUcC0tgr2wGn9WgoRifDH
         gKPJ1hTfx5JNYDX+deZEp98DZCbWHVoEbV7/AH5pVGydvQmMpp4Jcp5F47TVhNuIvxtX
         SuwCc4RML2+idWggnNsHCt30mCgj9p9Pq5gHb7+ycKJGAVxsYcJsrny5qNbM2wDa1Ajk
         IJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013325; x=1794618125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVOppmOPF0oNPzwcOcitqSAGp8bpqXEMygjr0XfAqEE=;
        b=CWkvbqPSkAQLanp7zp+dr0r90Gz2kNcnH08alnohusaSfzM6Ri/dZTosYa+x0qUiiD
         w3VOAPIDzMmWLsEM42TD3KauX92PuS/Zz8JTNQVLsw4VoWWAiqgn27KSCAhAU0t0BYmo
         JmD5oSCdcJTUCzuxxh9LrWWQhT3ezN28QsviLKzAMkv/JwtKznaaaQWQC9RjQc36SVOi
         Oytw+YyuisQe7/cZPdgz9rggmC/tseM83V9RoBo7l0znMg072j6Nd/grL8ht9456FtV9
         QjJB3Jl06EG6UQUeJLwJd9KwVhNfXM1mW1cCWCorRFhIlz4ZBkj49umNk/KTdifno2TN
         qKkQ==
X-Gm-Message-State: APuU4Z8w0k9E5Sz59xdsurkqz6d4TXbYofkKAimVF3lr+/SAMGfMsbhu
	eYNzrQ/KHHgpRSISwO6b84bzlJsQG5U+ZtYdPaw0TscR/N7ek2gHZeudcjb8iutY9Oi0Q5ZZ2Z1
	/XjCp
X-Gm-Gg: AYBFou2j1OhZMki1niE58HrIfAv1mj+eEk8STQqfaCd8aPJJxkxYjJS3bOPFd+OhYJF
	gRcugd3jQ7vIDVZ3QYIwF3f1FGprbfhEmYQ1MDERKtNSr9JYVVqoW+N6Sqae3ioA1NXVLOYJ5Ed
	U1xTeaNY5tA4zh7uEnodlJ7jT7YXiY8PkNCycIevN+046GqmG/61EWyFGTY8nzLqYBpUciNA1Zp
	caV0ev8AF/XRoasWsJE5Opfv+OqvLocmPJAttzYj2DNml8REHbZ3uh+GA3jlPl6RGjzujOJtylb
	5MCBM+bLweauho48U4RJFx7mnQmWTV93T8ZllxIG7//HUKOfdkKpDLegw+ZOY8Ugjyzy9hqHzOv
	KJV8WCfoBm5z4YPQHEXmYPOhUR0tgFPZuGcXM73v8chtgwbcHOWK+s5XN6TEfhI/jfdq2tWcmuZ
	6WrJz3nQbmdVT10NNZa+Zt/IV5sRJfkC2xW2b+ymExNHViTq+2KsYJRoNWId4+qyDs5py//auDf
	geo8800yrEbBMg5NShTaiz9KRLYHRHsQpr9/cjiCpSe5v623YIHzkdhH9jlbVUsTZaMXUXuTHCR
	wP7vPFGU/B+sLYGS+lwd2w==
X-Received: by 2002:a05:600c:4f0f:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4b6df5ea98dmr73002115e9.16.1794013324705;
        Fri, 06 Nov 2026 17:02:04 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:02:04 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:52 +0000
Subject: [PATCH v3 09/11] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
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
Message-Id: <20261107-v4l2-frame-sync-v3-9-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=bod@kernel.org;
 h=from:subject:message-id; bh=DXNUQKSL1UUmzc8AGuykclATY5iBLPt7wD2yXM5hnAA=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh/S6VmlcFdfBkMCXtHjo8D/B2ArAk4K59QI
 gk6UhV8bjSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fwAKCRAicTuzoY3I
 OugeD/9kSVCLRPiCuIo3sJuPXfxeAcvqE3cKWqAtbtXSS//SuZxbzlayEcM8SyieSQQuy0s0LhX
 QeiczEXKS2yYZ0aHWWrI2YUUU5Y8YWnO8hj1ySrt3rPVuMEWfPZLciXJlaGSugbvBpizLjBpzI2
 WTwoQc0oP4xqjN1/9PF1L+0yjd70ZU5+uMxGSOq3RNlunM4OBWZsMJYdShPYAEVIYJykvyQpTXK
 LpXUV1okjlx/hYeLvV5Jh5TygtS0hxfqaeTfr3ugGiWJ3+FsSBD/XAdJrh4ljg5OhGgErigTQBQ
 LZypl/zdYwJavXdaE6M1btwe4qb2YFY/za8jsL3R7Gqg9EmDMvo+DaBnSLr4n6oC93gCerOqx4F
 R41eYxhqhD0uSNmsv9SUp62BVUrXlk6m5hxq0GxtSBW/0zTDkyS5QyV37VxoWcFKXt7xL3sYXlN
 rA6wWWb/n0PGh/5j1YhLPiKWSaDn5nWswURE09oxWDkY5/dznljUomrjjK+Tocjj8zP6KcecRjN
 9OOrmM2U/eJx1xyfBgjZlHW1hDqrYLyDYS9Al+rb2e73p1yPejvsSTgDctRe0KwSINZ3h+1WizM
 MMXkXQvTnsiZ29xKkg7ExaJEph8gZilOPe6Rmmh+NbwXm0neu0TRAoFM/45S4axaeEZAF6c5DdY
 bAmUweoGQRMjvOg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Switch frame_sync_en to true to track and consume SOF/EOF data.

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b7821019241d7..7911b30494ac9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4255,6 +4255,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4275,6 +4276,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4295,6 +4297,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4316,6 +4319,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite0" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2
@@ -4338,6 +4342,7 @@ static const struct camss_subdev_resources csid_res_x1e80100[] = {
 		.interrupt = { "csid_lite1" },
 		.csid = {
 			.is_lite = true,
+			.frame_sync_en = true,
 			.hw_ops = &csid_ops_680,
 			.parent_dev_ops = &vfe_parent_dev_ops,
 			.formats = &csid_formats_gen2

-- 
2.56.0

