Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79FA4E430C
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 18:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361752; cv=pass; b=cEvZb2yJFj0jEscaJXncF1RLqxlGGKWpv9zaS0ys14piDDYwpNSfQQIo8RopA1DTOLA+PeGkx1xlRyfXb12sDoTesObmkp1ybs8A2tAZF0dPZ4e1cBNz1f9BgGTqMCiIklZ9PCsexdsDspRMrRraVrCuzEvuJeXU2abk9J0PXG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361752; c=relaxed/simple;
	bh=DlEudOypjlT0UT2XU/5WL96WZISmA/ECBN7ByCN7TWo=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRxo58h/HHtGOw2rmuLuT0xkrXOmrCVthXrlnb+nj0qd6PCY+n/NLEzVwQ9kuCHl3i/sKSw6JxMZfjPhE7Hx1xn5K4Qv8ACieYtdxlbGeQSAC7A0cMKfZQhxvkAH6Sf99XIaoTj2PAy70IZffjIqNYV9i/KjON9Jj+IJmS5u5LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOTkTZBP; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOTkTZBP"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so178660766b.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 11:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361749; cv=none;
        d=google.com; s=arc-20260327;
        b=prFImKSjc1af1uP1JhnsY83c+57OUls1DPzOkVmCbyy1MNgGfSBA/3fG6YweGT/GAq
         +4qoxYVj+W61+ezARFu307TIQVjwgrYSVeB+rWbSiR36Z5IkdO0ZNwHvp4eMf+TmY1+t
         5DSiE1mDYUzfi3pNZrpdds4YwGUumoIh9soXmfeMLW0/7eJ3JfnxA0orJfXJBYdYCOON
         CH5yKf6Ix6thHe8ZTXXSllMhwwhQRDBPQK5oK9qc7pUYC6JPllZKGIisypo+Q3GolSzB
         TtWocRyTayL7mGDmDNsFOGqwUdD/5D8cewdAFhrRx8QfUegtZTwnIcsqZTMYeMCzDoDE
         aTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        fh=Q0eZz3vhqRA83bTAI+dmlItxCVzibyZcLXaZC/3vJjo=;
        b=OHGmXka72eZixZ54lRMHnQtKVvlCImeXJIHs8GjUHKXk8Gd7SucJ9F4Q7jMsVobmta
         e9Oe5wjmfBXCQdXzalesOWqn6iTTcXJK3+CyBKbR2GCifA4Nxq9q2BKXazziuRmQW5Nb
         E1fhlqxUkKiM/j9UX2cOotDJwD46fw7OVoblo74pBHlT+lDN8oLOAcXzoAlT2eS/dLnr
         HyIteQSgI2ZJnARooLOU3/+U2ZT5/b8SAXCBl4r17BWkGDIZ9/HK+a7U8tHTwKmEVsY+
         Hn6HPbHZpG9upD9XOC/Tp6g2SOasbu0fXYfLgP+N8nbjPsmNNuNuuG5T90lsZeRjBdYR
         leKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361749; x=1790966549; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        b=iOTkTZBP/Lm7/AH6yWxrX3SzvVDy5ZLkhrQLnMoZBIv1nK4dGfrCAPMwWofw7kDqLk
         00bthYyZ5+B/ATTa0fFrzJDHxzgRbcGyUZ/xsLCy1YHZ9LMx4LDEOVB5YZikAIlBO74B
         7WWltWBTfBNUgICa9vB/ElUGNY+Ftp5q3bmHDiCqfzfUCA4sFs/m0xobtgERqJFsKP6e
         r8cheojJXlT3BC2JhAE78FzKaoxv7x8tLhFvJ+8JQZWNW6pTfF46NnH5VQmyqBcsNz91
         VY4ZGtQOU4ZMZp8RkdmEPLX+mDja/J1fAC0GbmxGhx5mTas0muLBe5s2dc1CEm72G9jk
         jOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361749; x=1790966549;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vaQh9agvQKXu5WYBVA5rNUeh6UbMXv22v7ZPcWcdZXE=;
        b=dSG92PkdirG12a/7c3sdBNWvuUj/5Iez8ufiJgDpba+2drwkwVYVob84VXErvmjLHN
         DzNNsWfosY8Nr3R/O/8nD5LvQx2Ty/UiQkO8EZGbGlIGY9ItLeZoPDh8WXaHKx7QQz9p
         VzvQJs05+zuL4n8AWqNcQ9/yDGQQ7g45W5unuJNJG+0Wtle1pQ2u0Op4WH7wAy5sO/bn
         2owEs26lCSdj6SxrfsZANlkKjdAGKliwb/DOFoQYMjQvmaYZntxjRvLQAzDwf0CJzRHO
         iQ8NdBd9lnT4lptkQmMpDXHY01azgWzMGAYq29wxDYhOpWib6DHINuZ5GgcKbbVZh2Ir
         QhHA==
X-Forwarded-Encrypted: i=1; AKwUvBzvPBQjQYVDRFdVJQEcIv8H/oqw7QzAMnv0kQko2sQWqdQPaTObpZgatQYerIurqYqjo0htZLD/nOFSIw==@vger.kernel.org
X-Gm-Message-State: AFuF++lqKz+J2cVhGPyW9y/Bc4ScGV8BQ/anNXtqNr5BK2Wave3e0p3q
	1n65gR5S39XLKDfQwQ1HYRGHllItUFkzVOgEIXTgAQtr8y+W4yrEtNpEBJpOSIGNnQio/dHQTp2
	5ZnH/UnpyDN0rKGLRziy+8zWv8iPARQ==
X-Gm-Gg: AYBFou1tuAdhU8SztOZHuEtpZKo1e2Kfx6RFlm51qOzrSMepQ6qqWg2F9YGRAS4AgnT
	w4o9/ZSmgcyz4D4y375YU/tIEuECRWO6/Gx7JBMwaaKyCYWSvDrcaNV3LKH8/nsDnwgCAR45+dd
	CesJnThFNG8NhtUmkxiEhzS32psAOejFutCAYu31oX2PaBfkcKQaw85cRFtGGg2aiup1yoq+3JU
	2jc3/wG/1ehgwdLj6J576Kodlbn5OGluF70u3Gq9JmsWCvi/vfkUW0ve/fqYqgB8NRGKMfd670o
	UWIswz+YRY24oxXmXvK6AEwDIFmCoVhb62O79a22dNZhwBw8ZxX+trLAPjY+pz7RPvLrzoOHIoA
	+AWEwIZE7ZCQYzBiWkSJ9KwjfUtCtZDNtJqLgHblqQlCzH8YC8ED8tIPH0gezBPi4
X-Received: by 2002:a17:906:dc90:b0:c29:57c4:cb92 with SMTP id
 a640c23a62f3a-c2ac228849fmr621819666b.0.1790361748717; Fri, 25 Sep 2026
 11:42:28 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:42:27 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:42:06 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 18:41:38 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
References: <CAGEsz8HtRE-sAM2YfC0_Vzcq9OeuMiRVc0cMTpWogt0Uwc4-1g@mail.gmail.com>
Date: Fri, 25 Sep 2026 11:42:27 -0700
X-Gm-Features: AclHuK_62Txs1R6aJpFVtyE2f4h_5eO8zVZDoQklxyOE6uOg6AtGXwg5pp6EdGo
Message-ID: <CAGEsz8GWLwXjNKo-9RpR=sGWqoqiaW-bmT9o+fYsTJSkymiqNA@mail.gmail.com>
Subject: [PATCH v2 2/2] media: venus: disable recovery work before HFI teardown
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

venus_remove() cancels core->work before the IRQ is disabled. An IRQ
thread can queue the work again after cancellation. The work can then
access HFI state after venus_hfi_destroy() frees it. The work also
requeues itself when recovery fails, so cancelling an already running
instance alone does not close the race.

Disable and drain the work at the start of remove, before other resources
are dismantled. Do the same in venus_hfi_destroy() for paths that bypass
remove, including probe unwind. Disabling the work prevents both IRQ
handlers and the work itself from requeuing it. Drain the work before
disabling the IRQ so an active recovery can finish any IRQ based
completion waits. Then synchronize the IRQ before freeing HFI state.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and
helper functions")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260730153912.BAC5E1F00A3D@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c
b/drivers/media/platform/qcom/venus/core.c
index 243e342b0ae7..94d4b8688ac2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -538,7 +538,7 @@ static void venus_remove(struct platform_device *pdev)
 	struct device *dev = core->dev;
 	int ret;

-	cancel_delayed_work_sync(&core->work);
+	disable_delayed_work_sync(&core->work);
 	ret = pm_runtime_get_sync(dev);
 	WARN_ON(ret < 0);

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index e7e4e78a186a..20b8ba1e62f1 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,6 +1689,7 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_delayed_work_sync(&core->work);
 	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
-- 
2.53.0
