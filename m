Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC8171BB
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 00:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294951; cv=pass; b=RE2Pe/FDRTQLiM2CQVdbjjVCONVZIfTJESEDkdRYses5EZNF1Du6mwQs2Y5VBf62X0yYXkQ8ceqrlsemOoR9ra/9UHKNTxC8fZS2JdCEQFCltN0xueu0dG0YMbo56eXAFQKmh+fpQF+Ztqzk0S1qh72CZaQklJpeYKu4x70clj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294951; c=relaxed/simple;
	bh=CECXwz9NVJRqM1zgzja4MxTHWcCU82DN3pcsUZd/76I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=HCQ1bB/oT7f22o0RImDhjGccnPumwh6+zxuPE/r5rzcEigvQUtzBstMnX8kci7TUfpZbgNxQsEuo8uR6wYQR9YNM3nGxeYu4kAfMYLTb1tF47PLaropdVMYrA0Wku6wgscivg/Mh4JUGGJFeRpCwMPcmuwzAqtqd8Tzhcza9YTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYP5aIVy; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYP5aIVy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so37057566b.2
        for <linux-media@vger.kernel.org>; Thu, 24 Sep 2026 17:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790294948; cv=none;
        d=google.com; s=arc-20260327;
        b=ACX8FCblAoTf8nB4ZwTQh/6HBTDsvvgn52VPFlZnK9y2QnvSpCCiLn3dlymBzEeNHe
         fM/jodaMaNKGDOO6sH203LMMFeEwCswlGgIMdsdmQzEdkaeBoYKQsncp0U5mA3tC8pS0
         MoXJdcYXwAllLdh9d7kiX2A/opvGwTOPmg6sPGoK5xNF5GjkjqvzD1/jCedMF1fLp6RE
         LnyMuJhY+rcYa2kQd8PdNAzTrvlsDb9+OlSIyBxeHj9O+3iHZjwmZTNdiIo/vDjHQr4Q
         ZjtPAiJ4zolakz8BhPCfrirLbU9TAeIZORS69XF6HpR0fWKHSHU/up3j9SquviAEWBgz
         T7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        fh=LBVaSjPQXGf+yg8A9T6WgWUKGSdFJChrMex2591+6w0=;
        b=rpHWhAqBE2AlC9Gsj5Y80asDPjM9t33Ni0nMY1Crndibsf1UXOg0j1CYOzDmwmLATX
         V8mIFB78Hw6U/KoYRrfWHoMoD73otVrxfGtkJg/taQgtsDxYV26r0L9xbExmw/jk+zrj
         W0uuNDelGGy+G5tdk6WEvVbKbkc3jdmNvdwpvu2jVaGyFaGAyFsN6V/OtM+ov3oLU90V
         Ekc+m/UlJikSQzBmaGeOoZs3o/weq/qyVY7JsDLFn+82K0dIylQR2MCjIUlrIHNWCrUT
         SODA5jNNq/WbiMT9LboAAk9bB7mDED+WdJiLLD2USUwR1UlCrwG/A3NUShNS8jYFyLar
         GlWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790294948; x=1790899748; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        b=iYP5aIVyIeeS1wxy0RrhItS7i7zqc16eXkOgnFkJjoUNC/uyPZ+Yz1nI5FISpHqyET
         DZ7gGonG9YtPmxlKQVGoSykkEKghqLCJPEHZKCv3ZCaDsg/ceH+LGcY8mmiu1Q3YZxep
         MVCbh9Y1umWemrFjuN9suStgzII0kccsWFi9MZjuP+i4WlFlDeSwQhZfkGSoVtaTf9bs
         4WLlS13TQXIIseuxOHINovaI/4h1aZzpMCzhMtmFB1Aumna8Y/YHeUvRYzu5iqD3RJUS
         74bdH2QMbdZPuDJ9AmHfTcuqnw1rUlKOV9AqATiWV1W6hLbHpZGU23SMkz/v7bY0aHaD
         puWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294948; x=1790899748;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JvVb1ppKBUi1pgXwEpUrjpuTGibjVjV3ESWoiV2gIGo=;
        b=edWTDxeF2JIVqmGB5aSIWZdB0vopLsWy8TpVi3j2Iw6yPkGysiNW2Hsvc99BoGDHER
         H1QLALjOkrrxQ0dkYU2BLSrHjOn00Lnl0b6MY5QtM8/Z0Y2XpzNYF/tVs+1F8tNyXN3Y
         hpm4xsdsuLadbHclkCJcM4d0UVfSF1LUp2Es4lB422HPenGKqxE3hv4YGVVXGsPlUo9I
         8IjdwC+z+gt75r1swurYEwnAp7e9LkAW5UW1/eDeJ+DYiV500KShITnJ3miVedOWPu48
         O+TvPEIzAhs2zQkhljclQ4jfixQxe7Ow0Ywr1zuJqKbvXTO1AnpAl+GyWEJ3zopId0+M
         YtQg==
X-Forwarded-Encrypted: i=1; AKwUvBxXo3mOOHUmbH2HcH9SFgPZ51b9gW82ucd17v6QGHzDGPJ4a6jqgzaoW83IXGthbrHylLAC9XuPA8S3YQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mBXdeHO6cwq6vdKwU5lwod9N0y9+K8jdDMQ0GGIxuJBMr0tlje
	5HhD9KxMmDZlNINpEIsgeRcPLHvByNa7iF4sYQaFENHuMN6XzqmbQq8caycSwSJnSp4vDR3LXVJ
	txiq9spYQQVAe01RiJBj2SQ+uY871pA==
X-Gm-Gg: AYBFou25sTJc3OoeE8lPm9UftXnbzOQbI0DsAo678u/Fqp3dMh9+tf34J1eZKlJjY4A
	PWhClRQQYeQSCmtSSzZCrkZ+seZpRoqoa70vPvUyCjcowLNwmTDj5LF6PPhlvGiZ4rv5o6snR8a
	1Q4Qnha2vuuHhQAEVhtbbBb+gc6aNQDNbaqGsP0tSRgSJwitD3Gd74UlKSSHYgaA6QeS+lVEw/b
	dUaCIG2M8zlzSn8I6TqhvpygnTMepE3TefHQJeOsVpnKkRYADSnNpFwIDFEF96KxAM/V5sl01hj
	hElaiQq71+acE37ilniu04H3rcNK6sml8HJGCeabaBhKKLZfnpaZconcyOjXB/Pj/X7FBD/xMkE
	Zjxd852LUvWZmn+jk6bagZqHm38HguFq9qKNF26co+D5VtD16HJdDH+1I2SH5F8bC
X-Received: by 2002:a17:907:97c3:b0:c25:9102:ed with SMTP id
 a640c23a62f3a-c2ac2311b07mr339426566b.5.1790294947745; Thu, 24 Sep 2026
 17:09:07 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:06 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 00:09:06 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Fri, 25 Sep 2026 00:09:06 +0000
X-Gm-Features: AclHuK_ad8LwT8kuVDl63QDbO1AN6EHbYByYWzU8WNbNKdgNeemyDEcExbIrb2Q
Message-ID: <CAGEsz8GkK7ZZoweuoR0DwA=CaDzJtQnmTWasEW=wPRv-yBeKew@mail.gmail.com>
Subject: [PATCH 0/2] media: venus: fix HFI teardown races
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mhun512@gmail.com
Content-Type: text/plain; charset="UTF-8"

As part of our ongoing static-analysis research, we reviewed the Venus
teardown path and confirmed the race reported by Sashiko.

This series fixes two HFI lifetime races during teardown. The first patch
waits for the hard and threaded IRQ handlers before releasing HFI state.
The second disables and drains recovery work so it cannot be requeued
while HFI state is being torn down.

The later Sashiko report also identifies a separate resource leak when IRQ
registration fails during probe. That issue is outside this series.

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.53.0
