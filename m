Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549946;
	b=Bs6B/5FHkW8UMU1yw4dwKDvs8qA6K1sxiCB3WsEb9pCpdtwnSzhDZiwQTE/FEK3zj+6D
	 Zpltm+OywAK47Gz6sj4I2AUVOznTxPrjhM6rsbYQ83ZX1bmK6X+BiQgxvWP8yZvXAeur3
	 +1SroQ0/2YX/PxLq46Z5gMYlew4wE75+6wLbgW2vDQUfxNaAivxrIogvTcrCKIwpg+7ih
	 aZe09hKo5gn/rqRTw5rYwEN9nHAd1jokBE5Qjn0angnaWoCnZkgBTBHvj/NTVebn3PsKl
	 vQkb7Uq5tRbW7+KQyuqlgVvrYOf+JIVdBMQKE5MGyZjsC14PYnfuXdCJh79gkrzouzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=1HIbJO74Iqp1oOB2hqutGgfET8pvX6fesRCNB7VwFnY=;
	b=cxHFAXTuEcLPjL5H8OwuFyHU1iaF+knVZBKeVzDjCDzarw4Zag4QRF6l/JFRTuhQRu4J
	 9KoqjOpk0u+duEyHUZhe9sSvDMDU7K6K3TwBYB96/VDYgnQ8aiaW/DxZGcIY7N1IDX4XA
	 tEys8TjZLWHQIPdszxWRVHFFPXwyua6cuTg0EArKZJ5LctbbSstm5aKV3CoZbdvFAaaAi
	 W5vCyBhNHOrpXdAIOChOXXBN7qzzuQFMEzMyiHc4rlpsQten9iOqrmCyeTq7BJt2ODuXF
	 I/gYhZGbggM/q+VmibKEUBQ9pC2BXQf630TawQBoZRfBEEBpBI9+gpJvjGiXZWBlHuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csTRecj8;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE81606A681
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DE81606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=csTRecj8
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5495d549924so54132161cf.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 11:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795549945; x=1796154745; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1HIbJO74Iqp1oOB2hqutGgfET8pvX6fesRCNB7VwFnY=;
        b=csTRecj8Tft9iipxAjutD932x3kqi5w6VvptsfC1QZDOOxf+ymDYzNXIri/9of6KA3
         pSGbGEMw/scdow4AU+eOKcb4Tz5La1jBRt/KPoB3ssdW9OcQfwVTbq/h07L27txOtFo5
         Aoxj19K9ag544Jp7ZVoAPecxfh2dGDV7kRTSP3GriAYX4Pb7+SjSt4Yim9JajSOOYtYy
         2ePdf55+WS/9GRC82vRc6Wa4eARSIJO5dAo1i+MaAeaDsRZfDYd8C+r7y4DGRnpbzP7N
         UraY6Lpr1tr3bM/s2u5ykbS8oOf+dHjKxqAgHMSWpNqTV7Hs2x62JCuHVVlGIPzDGoMg
         ehFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549945; x=1796154745;
        h=content-type:content-transfer-encoding:mime-version:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1HIbJO74Iqp1oOB2hqutGgfET8pvX6fesRCNB7VwFnY=;
        b=b13HfXSjIfcIjjBCdyiKgHjhx/Wr313Z6PASY1ZKpvHOBXT51A4JEqmk0LB0znoWM0
         W6j+gbiEh5ntZC2yo9MxkMCzsmnNLOYi98G6UlLW9RIWYkzwC9GgDEmF2APHxG3HPdoc
         LVoEvRs40an7NOUaI83YE16Hlv5MZAzLaYQmc3HxvC6qczOhrqb5vS9/LGADzWXPKiyz
         Pye6lowvNDsBVglb772M10+ySbtlA/FvyPsWfOWINkvEhbaWlywXRfEINWHZipzYo5t5
         1XN2tKq7X+W9KdUHxWxAW4l0mEe3U1728wozXOfBu9SI1P7K3rQtA3MsGfvVXj59p5w5
         MOtA==
X-Forwarded-Encrypted: i=1; AL+hErGTB8BaD3vUmoOxUsrIxYKutmcsSol4fXVfl9vHHNzBVCRJUgF1wXwgBr/j6rTHZXUcf/TD60Q1xQZvVg==@vger.kernel.org
X-Gm-Message-State: APuU4Z87O8vmd84ukNOK1NnAkppNoksarFpkzJVRhI2epL8bTBsrRQil
	vq1iFqju1OmH/UOKQNtQCnsTyXglifa3Aa6t1V3azxp5QqGslCH4/8Jy
X-Gm-Gg: AZFdTZe1TREABvNuoNpUX2qgdABK6m5qLQjD0VOpV2zaXOXCSOhcKWgTZ9dedfLSgtl
	XQdypiXyxmEWIcefJBGCTHhge2wtWFE8+Ie71wj6/5puYzaYhPubOAZEk0QLv7z/Llo2UnrV9Ha
	0lvlMRzQBFdG2154aU01pMVx7oCDEiwI9JmE34vPvjSEwnU3VCa92nYC57HYjrUPw0H26JFNGnY
	oPjSmLrXa1yrlWogWAwQMT6ysvZYSW8v5MHU0VvsRCTanYt+BFDsgRJA+U7+bJY1Jotca2od7x2
	6KBEXPDW/mq2qUf8GxEJE5jqx3eJkLsx6+aRrUd89TOs5KuFv5IFlXQYaOHGSJ5EIicgryJcueR
	lsSejszcso0PwWsCNv9XIistZ0F7pdPCjS+nz/jJGAF0+MwwqGx8H5Tq2hSSVHzKatml0fXvU3f
	5Af0zCmCvMsxsA5bZhLvPklu4p3gKmmgHithryubSOYkkqCOauEjub+sMBr/ZVbE0xKKnBd4COQ
	NNxTWirR1ZF7nP2IQz+FYclNK7jV+e6pB1VJU/4btssDlyVUfMmI9pWiYIDpgKWdcqTSxqobNvS
	pKCFEOoZgd41atmm0//hOsx6Sj2mx0qYK1mod39qcQ5ncuOXu2ti9/5NGu4=
X-Received: by 2002:a05:622a:1f12:b0:55d:10f7:8c72 with SMTP id d75a77b69052e-55d769e162dmr292187981cf.18.1795549945086;
        Tue, 24 Nov 2026 11:52:25 -0800 (PST)
Received: from daniel-desktop3.localnet ([204.48.78.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78807b5fsm134012051cf.6.2026.11.24.11.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:52:24 -0800 (PST)
From: Daniel Tang <danielzgtg.opensource@gmail.com>
To: ruslanbey@proton.me, linux-media@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/12] media: ipu6: Add support for IPU4P hardware
Date: Tue, 24 Nov 2026 14:52:23 -0500
Message-ID: <1979536.tdWV9SEqCh@daniel-desktop3>
In-Reply-To:
 <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

> This series adds IPU4P support to the upstream IPU6/IPU7 driver.

Tested-by: Daniel Tang <danielzgtg.opensource@gmail.com> # Surface Pro 7 i7

Front and back cameras work in qcam, kamoso, and gnome-snapshot with
default settings via libcamera. More websites in Firefox work with a
PipeWire workaround to force a resolution above 1000x1000.


