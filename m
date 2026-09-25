Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016861A6807
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294969; cv=pass; b=AntV0H2P8YHOhUDgePv6tFeqkCyJA9jtz1GgjYdhzvxhGVqjCCKNTLTvWOKQHMACPdNQWTm57FmpzPgjoqMYHkiZf77dfgD2YB4ZLpYQYzzF+dFQLrF551mgCiNraxT4HQuqrFHgGicwGqqtCOLaK6Q+Dx1zk0m/YFoI5mtKdnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294969; c=relaxed/simple;
	bh=YSMX5FLA+2PLf6XOskP8bd0x+m6bdSeEocRmUK+dICY=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2BqdravHQDnW4ULUNDlJJexte/n7AKWMaB0K6XI6HlS2LOb0UiAuu0hs2fdOo1yCgDFXzF8/mxIUZ3T5qUAh4+zMW4mrlbcf5IyFEwyxDFvIdvrtSZiw+dHT8BYc0Je+PihLkYwG8rq1+v5JzU5x0+B8oWqrbtsgIpnij0wlLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMGt7b+R; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMGt7b+R"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so52407766b.2
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294965; cv=none;
        d=google.com; s=arc-20260327;
        b=mALAhCZrPhDnCkV6labvB1JAlQAp77oclC3PUrnJt98CjaUhmzlQmUsvNDDbn51/c+
         aqgc+jI9kGMYpdsEAqi8RXN0I2FPKJdhNxySjRGKfs9r+Snp4EhnVzvOZGKQFb+NHjjr
         2tBG+ynd76hYvx9gv3iBngMkG39bdCS0TBXhuyuuvctI4b9JCZIeu6zaBLxycQJJZY1u
         mAPQEgPZyHl/HjzFp7CYEpdadyoz/5ollwI8bHwQLRY56LlR/njyHhvKmjliDR8ZcC5O
         IBxohtqp0o0ignPGBzkpj81xWjiwZkOonkG1Lu2moGkQlPV0c4PLjADVxkc40kmBnyGq
         yoJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        fh=yxKC6MapEBOoni2CTJ7G8zp8wG3avCaUpeEMtFSoYHw=;
        b=kEQOye0jaDzjNFhShoqXwjxt14XM1GPCga05wJF2Mb2E+VB1t8F2Ry2XSeHGJW5+XX
         y/XFiJluDdK41bqUXnZq4DZYw3b1FrCDMwzE/LijuhIyh6A0r1k9yiw/KvDpKY8mFjnP
         ZsTp4e9q3+mia5GabdMuBHbPTgHGmQp9bufv+srPJj8lp9bKpiXt1Npyw+b+qul1pwU9
         hvQQIiSsTmCCOus2YjP6aSfQZIcdpbVVJNlCO25oLDAaI7ChkaW25UMJuJt1EfeyRFsS
         BkjYrYiJRJZUcMMjuPFJ0IgjUyux1hspYtN5H3adF1zyZ/IRtzKOVJSLzThMJ3Jk4jKN
         xITQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294965; x=1790899765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        b=TMGt7b+R43WhQbmZL3n4NTNVIVlbBAiInjTRsUgiqqWIhBK08HMW2yahUbHtQDizHO
         CnaLr0xp8ExNwvlSqhUl4z6967ScxsPMITLAltzxBzggwyA+a/nHjuYkmSdxjwTpf9CQ
         2TAcIMUrnVWTncZGW2r/l+KllcbVSS/E0ggvy+Q5GLoLpIXDzh4jV38RvZ2+11H29IVd
         ei2eAXEO2V6e1KwXNTNfoo3Q4sVAESBmHY05Bv4M2KB0z7rKXN0mm92XPFYa4gjdNzXY
         gRJjh/zr8l4k2Ea48LrbKtMYB2mNvJGHdZFmh+xtaS6LexFejeCGiKxrO521KTYk+fig
         QtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294965; x=1790899765;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CyX0bYFSyTy1F08pLyuTwWBLmwqeeaIpLJGH7n6wEgI=;
        b=TV4SgJ5pnpHGQoM7shDrthWK/PtaRPglc7AdAhhx/E7D/ENnwdbdRdlVOeXNE3J3kG
         WDdY6M0JW89xehIvY3JWVGZqGnIyf33QneaEcPf3IOWMnFM8WVoes5h/IU6LaZgVvWY4
         2SAU0QPPs+lRk06f7KJWCYXuBb9BsIpIgUfIr1gNvn6OYZevLMdUaNTX3KST/0t36u7Q
         TSUZUTR1vBvdbr0A1Tjn1ZkTWQ+Ydf8vYksNTKiXIg/jaZMdRTGQHHEo5eSiHZJJ6e9Q
         HrJFT6KItOSYql8saWGASpggM07ty0aJHPpi++9u5Dh4PHSrRe6zdqjO4goUIRLtJCRb
         b9OQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjRS2dqc11En9IDlRtXBIC6eorQndEux54PYLJJaJLv9uyAoUTTDRd6EzhOlz3iiu8mTbzOM5Ln5B3lQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mSMv9KoXF45aiJTa0m30iM/2Q4Ac9VE6yZApkY5CIEWL/UhLuh
	e/ArRKJsL7Ych9yBNHTzrHOQ5OWa/+/wJcrTUxUV4kdkzHUlZ71AQcLsrY04+aS1hZLr//ngnxI
	IvC/xNKX5wT63lORP9qezkPo2HhGXAA==
X-Gm-Gg: AYBFou3qj6NiMtt7n5ilrPzUUKfs2iMMz9jU3ZeF/m8cR1b0Ixywboq5i32ZzKeQDoN
	VN+Nsx+A0x52miMEq2CFFlSbPY90DPxvyF5kqB0SjZZjllr7snUmeSRVM6h9Qukb+6lezeB2YEL
	aA7EfhNiRk0E2Ce3dzV0MVuPaYKV7hUOpUnmQr9Znjh1p3ladObBGeK4CDj8SR+/Rx8Jp4vMJjC
	xsz0uMAq5w8OBuAsNfNQVP5hevz1OruG/FsS8b+nTs84Bci/S5MoWSEyMIwBuBJnJdsl6y6V1Mt
	leAMQ7OUQJxVwHCHoVMpz1fOI2/xuVo6p1HF6MX6Ae81Os+E1VG9i2xcMH74UAvU5dxqz3cm29M
	v+UnkFHQEUR2ky2d1rikWxgw1ceb0U6N/sFfaxeZzO1I0a9fUyLP8PvW0y5Cw5N/o
X-Received: by 2002:a17:907:728a:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c2ac257861bmr361270666b.47.1790294965192; Thu, 24 Sep 2026
 17:09:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:09:24 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 19:09:24 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
In-Reply-To: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
References: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Date: Thu, 24 Sep 2026 19:09:24 -0500
X-Gm-Features: AclHuK8SQKUaayfiqW3eGLbdulCVU75I0EuHaaMSyB3qG3Aqki_rJZf295CwA-U
Message-ID: <CAGEsz8H02F9SQ70UmnqMz3wWO5oc6=v5YTnAobBPW2a0reWeJw@mail.gmail.com>
Subject: [PATCH 1/2] media: venus: hfi: disable IRQ before freeing HFI device
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com, sashiko-bot@kernel.org, stable@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

venus_hfi_destroy() releases the interface queues and frees hdev before
calling disable_irq(). An IRQ handler that has already read core->priv
can continue to access hdev and its queues after they are freed. Clearing
core->priv does not revoke the handler's local pointer.

Commit 640803003cd9 ("media: venus: hfi: explicitly release IRQ during
teardown") added disable_irq(), but placed it after kfree(hdev), too late
to protect a handler already using hdev.

Disable the IRQ first so that both the hard IRQ and threaded handler have
completed before clearing core->priv or releasing hdev.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260612103333.5585D1F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c
b/drivers/media/platform/qcom/venus/hfi_venus.c
index bd82066bb6e7..e7e4e78a186a 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1689,11 +1689,11 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);

+	disable_irq(core->irq);
 	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	disable_irq(core->irq);
 	core->ops = NULL;
 }

-- 
2.53.0


On Fri, 25 Sep 2026 00:09:06 +0000, mhun512@gmail.com wrote:
> As part of our ongoing static-analysis research, we reviewed the Venus
> teardown path and confirmed the race reported by Sashiko.
>
> This series fixes two HFI lifetime races during teardown. The first patch
> waits for the hard and threaded IRQ handlers before releasing HFI state.
> The second disables and drains recovery work so it cannot be requeued
> while HFI state is being torn down.
>
> The later Sashiko report also identifies a separate resource leak when IRQ
> registration fails during probe. That issue is outside this series.
>
> Myeonghun Pak (2):
>   media: venus: hfi: disable IRQ before freeing HFI device
>   media: venus: disable recovery work before HFI teardown
>
>  drivers/media/platform/qcom/venus/core.c      | 2 +-
>  drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> --
> 2.53.0
