Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795498648;
	b=LdBwVUclx0ml/sSS/mYuuEpTGY5V43RH1gxpREPWAx5QKi7tZ4yCLHMcgGJkolZC5o30
	 E88qzixkgvHdzNw3WWsJfyUqP6Muvalzelh3ZdKCIpruB00F/mZRp4BnEiipQaIwMdVc3
	 b4CDEfJz98gFhu4pGbStxURdqDkzmfINi7rnDHLfL4WeJ4bU98semYCdrAhkW5bIwqsOi
	 WRkoKbr228AhQIgF02rLBIzDp1hlcXoMOIy9peT81YoHupd/m63KNlLRt8f+zJBZatgEj
	 ELmKDXwc66Uy/Z1/pS4OCYjh5rGJBsLQeJ+M1DS+f12viwNOj5BJE8WviFlnpSMzvVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795498648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
	b=LfGGAs3izxPPcq7FnTbbgbAAcQJy6KbR8hUaBJPKsspaJxVaC5LJqKNvlUz8LKELRB/d
	 elNLiYdfyV+ceme/PzLkM4EeRdH6+JUlEp1ZW5iuYVW/XJwmRPZxMnKn4faUb/HfYN6fo
	 Ejehx3/CNzYgDC4bXvUZ07mR3xW0Z600sQ44fEQnj7GlFNOKE3iPFd/hWApapSh6yIcO5
	 TGbcMTv13aNnBiTsDQz0leTTwCPToqVYX6IWcj5Ee/F+nCtpBgGFfLk5kBTIysI4EMQrC
	 8n+y86FcMl0CwqLPYWoa8QXauJFJSpsLoP1mDiOoxydiVzDJMCYT2KNAbgiTfHyuYzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D26nvVun;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A09606A322
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 05:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57A09606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D26nvVun
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so31948845e9.3
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 21:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795498646; x=1796103446; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
        b=D26nvVunAP4Mnwzx1Nr3m+BbLbW9FKUTChKaqL80TB3uvaZlClrfZBvBh1Mo3lLQTP
         rbwcESdhw9k+QJ6YCLnNc8ocK3kw5iPJYysR2ICP3i0+z3s90c5e2OADn82CbFCLQ1v8
         Ru08Jnjz4zxLWYIh97VXinLBiVDrd5SyIRXUiqN3CU12wGA7rpn8fbyAkjvSyrbrBz6L
         tJJAeDZ7ro9Q2KbwtiYwMC1RBt1Dbcuk5NNFXXioBns/MTREoORvoklSj32uhdCC8BC/
         ukWDNuKQ0bSwLanFvDbCeBvAQV7QiAu+BrQsS5VO6EribiTy71NzA6S252mIHbE3NL7D
         k7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795498646; x=1796103446;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aErT2kLIK2X/FxAJIiabzmuR8QnG936yvowVUxXauc=;
        b=zYsT0Alk6OSAWx4zlkpBp+sh1AY8tXoHRk65w09J4Zjzo6sHleh0yplCJUfkDy7t7b
         MzShiffcf19BrkEsXEpDA7/Q7azQTz9koqUFeJnlFAtpl6iLnhWjiiiXx/DPjC84qZbt
         6baCtst6x+foRjGycWKruswLTsxbcnCmQWo0S0ZBTgBPtA+6w6ZqM4G6GhgnhhP3a3ma
         hefiABpMbnU+c9vHEWM+Zevq8wOgFMPvJ7XhOIwGT8EjmnbVU/SR3kDWpBj4Vumz7+ml
         DmYyd1X8YosW3uFZLgaEWTyRpaYnbX5kXqieQaEsvV6VWIsgFaOR4sxM7XWa308paTBq
         nWtw==
X-Gm-Message-State: APuU4Z9xBn7dRFAb0FaFWq3qAf5Q/H1tIRUklR6OWgWs4UoBceiEpoEp
	yk5VXqxkvMJIxZi8l3iCVGtnTddsOXXpFs/QY5cf8GiOBcRU53jxsnUs
X-Gm-Gg: AZFdTZf483xQcTimb/aTrG6cTHTpkjDfvg3gbMQswKSGzKanqrzPRbWPFNVMpbdZT7x
	aiBvu5FkMSDLhikDHC780XqCuC8+35Yy1kNq8Wqxh6GCEjmFRYmSyfBDn/F9VPR81ayG2nz1Us2
	OKiy/2Zs/pTtsxbO6S6dHG6lushRenUIRI5z/xwRUFP1VTmHvMU4Kua2yoBG7HsHdTpuDc/nuiB
	PJE2xi4o5GxVEOOQNe0g2NBMEr+chm2Pfb4vlPFB+usDIjSXsq0cTK4TM82Qo2FDn0HpV81FpOz
	KoKNxE+/S8DoAG/c0e19zss48rqMtBtKZrC/3D4ZYMq7xLWUtC5p1O/BhU6K8aVSp56WJ05fjgy
	TBULfFgXriwVpovzyXs7dS+/a9Yil+VW9cq/x58i9YbJqLdz9GTA9v636iNGSR9+6kjFEWHRK/+
	IHOaewcieSGS5cs+VG8O44l4Pt5AekcQKW0+AoBhnIeHIbMSMbGzR6qJEjin/x8NrhijUf6ahfw
	kzyh3uKZaDim59iSqQdsD0IEhdHSSN8kDvLqs9qj1DqCHj0NElVd2Zbaz5ZvWyieY5Wc2rUSiS0
	57DkstL14h7uRdgyQ2bqmpwHKJCc67r0kuxIDO2RvZxsrkKMCjStIYXzfrh2443oU/Z2xJ09Yov
	YYrwqPPLfkDDXaX9Y9h/rd2l++8RVovVDRJtSJ9gZbj/Lelzym7WqRupIx3HEArjCq0s=
X-Received: by 2002:a05:600c:4e43:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb8893c2d4mr277734055e9.31.1795498646496;
        Mon, 23 Nov 2026 21:37:26 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm323959585e9.0.2026.11.23.21.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:37:25 -0800 (PST)
Date: Tue, 24 Nov 2026 08:37:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jiaqi Shi <shijiaqi_develop@163.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-staging@lists.linux.dev, slongerbeam@gmail.com,
	p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com, kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to
 v4l2-core
Message-ID: <awUika9V8utfgFXc@stanley.mountain>
References: <20261122114205.494704-1-shijiaqi_develop@163.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122114205.494704-1-shijiaqi_develop@163.com>

Please wait 24 hours between resends...

regards,
dan carpenter

