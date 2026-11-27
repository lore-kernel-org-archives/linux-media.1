Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746437;
	b=qWBUcdjMANanqYh8JxCJah97Xd9QTrBwOZidiZoBZHCasFiT02G2Tcftg1wW3+k2jrXy
	 YSPbriLJ01WtZFBgr/RlcpmRgn/qXbPaLFXZ9No8JblJTqubfNYtCw7NV/QxbotYaR8Hu
	 xzeLjLedI8YdneR7Kw+kEPwlmfvrvvi9918YQgQuyJb+zsoK3isuCzLSs0Wx+R45b9gwb
	 xl/flOrv0Qs3Zhk+l7f/6Zctker3/PshWe8IgGHIGZaz8YnDwGCcmMGgxYCoVgpwuTjU3
	 x+FcZQOMw1E6Q0z/VL5MTwtc7HCNWKGqh2GYptH7r4VoDGFmtLzzDVcSRvEbgwJoVdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
	b=Nbz3ZXL28ShzMab0zwYeXrK37uf/YsyJbt/J0UuErPP1n0X5N/fkovbogyljnkayMyXg
	 kC6CoyfREGDTkMMUGHzakxU6dShUMeC8t4xfXVLqPJVOkwAh3Q7yTfJuQhD6Zcv5kJa5k
	 oUEJSFG7GsWmPPckbUCO5xMe+eOrUia6xyl/laOKaX59WdnycP/xw3q+4OIl+Sp9LZARr
	 o2MJcoCDF2q1HQRcLh87joJsvU+pl+d2jmlRmZ0lKEmKxXTn5+IIJqpk1rfLTV4sI3as7
	 mGDWOYhGNBafPPB0A4rvIfuARCX9qMUKoRYUXQQs7GrukImpjtpfa8QAFUtEcxQRtlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYoD0ME+;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2217606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 02:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2217606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYoD0ME+
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f0426a65e0so46510405ad.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 18:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746436; x=1796351236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
        b=SYoD0ME+aq+mD4AGlnesWPsK4E9RbOCu/bvQdzLNNuDEa9pF+waQ+DvrJxtWfE+kDl
         B3wEtTn9ThiDuL6k6dnXxBcST30Vo+fj65hhsSxgIA7hwMFnlUx2ex0vxdSciZcKRnEr
         yzvL7XZMg3VS0YbUBJWk9ZP6qpjK/1CxEb1CoPfyB7NRww1d1cVV1SQYVseM1oYCDwas
         GeIUrSYJ9SuA+c9jJ3n2pZSaC2XalvVpo8CZAho50rz3b3TTNOTUwrrPpb0s8JWqBFU8
         516MxTI/TL9NYUNsDlTDXsPHuCgAwYklmTWRgpQUe0TuVSopDPogULSL1SFPzHCI+fR4
         hQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746436; x=1796351236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJBBBgFeyRHLupMJKNp7qu0AyiXuwDo4GRynD+DGoec=;
        b=GZhGnWtXRlu+PKcc3Lr0htKrzTVgQ2D60MPwvhL9wDdHl+ywRdSjm2Fgb2OxSmOq7B
         c7fyvMIhCd7PpbD/7OWMI8k16x30eWZFC+77iOl37MmcICYKhOZbEsRE2lBQ0osvrAo/
         JUzxBK9FyYIQ8/Xktp5+YPk6Q3eB/1lCDxsQiV4U6T9MfnzR27dgOrgyyYHFulsMb9tJ
         0XWI+HMazb9ORhBtV0F3PhobhXFCdfAu9UkNqE2M5C9TzJzl79xnecATnIHUg7XLWeDF
         Ou30+Ve4IZWmSMfmwxVi/ltiHhuizZ7YMHkIbnCDeaBpuWcFFC4BNZJpCuhL253FSevT
         63mw==
X-Forwarded-Encrypted: i=1; AL+hErESjdALI0Xpuk8JnPSmJse4fbL2fPhjJICirgDsUlUUZwV6/yHu1ICMozJLn0NtVL6VnI3MXn1FV9StOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8TPks5IKGpqAKBcb7jH+XnA27QMMSwyY4IR6uqOsC9f0mVa38L
	5wmLbxkCvgioeYGb4keKLuCYmW82NHV/HinTdWWlVbrynCXoI0KqVNYb
X-Gm-Gg: AZFdTZdAJ/yth07RTihBB7wh5NIiqszALwBmwZgmeP5bnUfQZa3SnCqKyycDRWiOzSG
	o25tXJ27j8A6KqTHuB3ywfkW5kdp9ZzCdqGToLzhL8ecGtLvOZJY10/7TLRY5vgq3TqcBn2WTqD
	AB2ay08afFG4XXaq7KYpbVdQeijv/6uelVtNfr7Vbik18Cx8SIzsU8ZmQsIi2Nulekc49XO/rk+
	b/twsKEXfL7w4KGKuFgPTTNp3BLLefEXIbAQZw5SSZuq6WCkuoUV+IIcozpG8azgxOeWZpKc2b7
	F8yvSPNd+E3S20Wy8eNiUE5lWJkYnxuvCWN4enKtH+LxOcg+NLe+jtfFv+eZdMcmIifMnF5e6NV
	QdPCjfsP2Ka0uz7gq+nJAUa1kdawpuJKDZ5LzReFckEZMI1mhtosX7lRIq/nmRwQVKkTMZ6AQY3
	j2G5FLdJSx/yH+ZrI4/pgGwep0qPCPbIZgOHGiImIQCF+vQMkz2q8/J7HIagsXoT5l9z8P9fXVR
	tLQcgxMJg1O2jZZUPLXtzYS1DJ4rQhD62WQgluA4tNeweRERsbawc+s9pUFnRhdAaeLap5iNlKk
	U8dLP9eqsEN366eUoJsajp1SSI1b1OwFZDYlUtIu6Khd82oT0aMrcDqt4VU3wSTk0uASk3yQEGZ
	KQAOpS7E=
X-Received: by 2002:a17:902:c40b:b0:2f0:7db6:50ad with SMTP id d9443c01a7336-2f07db65335mr158745195ad.18.1795746435838;
        Thu, 26 Nov 2026 18:27:15 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm57903655ad.45.2026.11.26.18.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:15 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: jacopo.mondi@ideasonboard.com,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: pisp_be: Initialize lock before requesting IRQ
Date: Fri, 27 Nov 2026 10:27:10 +0800
Message-ID: <20261127022710.685062-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260830150045.2704062-1-runyu.xiao@seu.edu.cn>
References: <20260830150045.2704062-1-runyu.xiao@seu.edu.cn>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 30 Aug 2026 23:00:45 +0800, Runyu Xiao wrote:
> The PiSP BE interrupt handler can schedule work that takes hw_lock. The
> lock must be initialized before devm_request_irq() makes the handler
> runnable.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be fixes, by rebuilding the
pisp_be module.

The driver probes normally, unloading and reloading the module 20 times
works, v4l2-compliance -m on the pispbe media device passes 400/400
before and after the reloads, and there are no new kernel messages.

Tested-by: Roy <rongh7426@gmail.com>
