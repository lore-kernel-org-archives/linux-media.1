Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794286167;
	b=SMud18C/V1BZOtH/ng29Dz/iZFj+nDuxYDwd9aMRGIAsQeMDu9gwWEXBZhPQJoTltynO
	 7sHMMsUZNtV5PkDwaKkAjJZd+fro/6Cb9Lp5XfwTe38Ofy+RNuygweYmunl3S0DAD3Jux
	 OsiiHSaF6mCuy2jq9p900egjJYnLKgWjNsBt8+/Ql9Pffx99VB/M2h/DVhb3MIg1hwRXo
	 7mqFlPXUMXN7qnVazAgvhNzNFMm0yqkuLOCcRpBBBevwtOibulbnN3U9QjZzPOQcg+k8B
	 KSNM/fEpu6+r2ve1BAh3qWIvuUo1JLNhZXcZ+D5pTiWiRXX69iMooMKFFqXb9uGQwCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
	b=48L5pffexGGsEfcycWXaTGIvhjJcMxGarDBOsnm8lsgCmRHdbOh8ONb5DEYZMfTQxLGn
	 1VPZk2O/Yjw/bbQtOFoQpMDqqBo7HAvzt88Y7JQyb8vqpr8NMNfxCOYQr2W64qJXeF0zW
	 XB4EmA/MqpazwEVVRKFIRJy49kjdVnLrj67G4D4uLURrvGL52zGhI0lG8/WZnykkZhMI0
	 u5JxfX2l3NPoHbXmA1FTntdF5pAFLVuk7EVq3xfKokOiTcr2UZI+RVM+VIhi6ThIDBTOn
	 Z7BeDYJtGfYox3u/JMfIGFkAkoRH0v1P7MhHu2v3OQDkcTlNY3Xp+1n3OA9wEmsMPZg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNAj7Hna;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53EF606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 04:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53EF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kNAj7Hna
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso277668166b.0
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 20:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794286165; cv=none;
        d=google.com; s=arc-20260327;
        b=IuSBIbA0j2HjLq8A9bM1SLTy8X8UVLCPY+xG0fwebNczkf6Gozvs8FgYfM0889pAm6
         6cwoMpZIT+d6hm3hN8CS2IXnzBHi4IR/2sz1i+lOImzALNH2K6NHxUduw4Kxlh9BLz9C
         Kt+lK7WHEgvOvP+bhgMour3sVYAHyY1QCrJJpScPnHQgJ3vRhELDTGEcwhVFecSrANsP
         hrje+vsEhHDhKtXZ3DjN09EG0EDxhVUtGjQ/b31REPsPbZ7Fw+hIW0w2EXOyq+6CnrMO
         pFw+JR2rptsWgGEsp/btJexq9NMHMPgdou86I7YtR/jK2udMCeAy0AT+VHKxnKsiq4RU
         hdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        fh=EXxRtdpVPbjuXSBOC0Et+kjFzyc9rVVEBIqgj8yPxCw=;
        b=BZm4TlnFMb/1SxSz0du9psNjpk2RB8U+TOaa+ee8tZ2yix5lpSD1mB9eeJ0ihL7/FN
         LhZ9OYx487loqqzAjGCvW7UI7VpRItc580HR5xd6L9XMNS85JXixvjDUXpGtT6xXBJAK
         Q3K6tNjYb4W0oVaink15VCtVXxm8A+EDlxQ9+dxxxuARFiN/eDOGFESVGqt90q3G+EQ4
         DTlnti4wKqPKnE7id2qC0Q+fc/BxQdYpkae9aNHS8DIc8aRw500xyesbSxeU27pPhH2H
         hYiJnPH+OUocILyZs6b3qJWRBlOMQXCJC0iCfahcxcYcfuYCwwMG7Te20Al7T7E0M3Zt
         xXPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286165; x=1794890965; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=kNAj7Hnam86gLl8THKLqXdVh0C1qrr1kxLtviI7/vCTsNqfeZxlmCyoWeGx/0zTCpF
         6umq9a1wq1Bc9+eOQ5j1SlGEAwbWdZ5jhMvn82c1glJoiwGJamNNdkb6wAq7CbKKpcGV
         BuD6VO6w3Hn6rfI2rNLarxBsFhE41NxYrLT8vRCKREfisA6tclNBTDhgSHAR/3NPezGy
         uDeMpfa5SOiLB3PPrZIhk0m46d7Ti3WQYLMSJj2a+1QM2CmnMal4shqDBZZyXhIbRK8R
         oFOhliLrOfisx8JhUDyrIExFXI3ZSsba8nuxYxEilLXt2IqmJ4pJ/XA0dM2my5FRDtNj
         qmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286165; x=1794890965;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ToRZM5Foy++C1k59kSDpzw5FEF6siS+FDf6LC+WQ3Lg=;
        b=p3KX2inh7Q7RcIgcduaT24XlEmMGMN1iHQrlCZ/+ybE28QcPWnzv17KfjCDKrWVS6Y
         oM9K4ragLB2hJwDq/KMmpYj7sgNFyjNfmzkIXAzmgYRkdeRkPReqReWunuNBN720djfs
         1CSywdD3cNMELgkd8m33ZeN3/45gyF3XqHF83+rRcvvvCawSxzjtS86TuTMUVIFJldOh
         2vREkpaTfmURi1fRS0H1cRoUJKutSDszQh4MNY1rcdNZT4nR5cZraAXm/nCmSpRqCG70
         5zyUrn3Ig4OFcdyqwmff7A9/bH85Bm7R6+B493GceBJDvd9EsbEosJPoOZxfjLaAUCxH
         nt+A==
X-Forwarded-Encrypted: i=1; AL+hErEw9Ql8l4s6hiMSvOCzgpy8Ekw3SAMZ+zMcYQFwCqdDGinrm4fnKIJxKzK6EjTghJK4AVujFMjhhJfYyg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9w4JGum8bmm5+Yd114+X6bkv6XLJLQfnpIwziz3Dzxud+SeoS0
	Jtb/Gl/ho9isbz7ZnJjd6i1xqFpl91YLo3XNl1Eo2F87Idt+XxLZeE3e+jU0iwRwi8a6mSlmF0f
	ajJ/A9UJs2JiWEneAp324yq9II57UCg==
X-Gm-Gg: AYBFou16ywLbT8yoUnWpAUGIW+8AfKDWS+3hG/9EJ3pOSrK4DEro7zmpZ3JnWnUB36s
	kBvGrcPUy7QanPshUC4sVFsz/v7oFIK7549HcI9KqIOnmLEAmNwDtNRouaXjsMGN9fwShVfv8aa
	aOdUF0fTBVQkqCPGgHOI3H1cXrXWL8OtxJJtZ+IDs/coEUmYUoxy81Bj4ToI3xx/0rBD+36hWkB
	Wb67z0P18ebdi80AZhcORSLoU5MIw7sBNVo0WLWzGUHSVkUR2632t2MiSefu5Ll0HHUJMSloJzF
	PC65OJ3DZGF7rFth4gFvQUy6MRsz5x6mqcXwF7/NDFJOiiV4H5Db1REEs+4K9EG9ODw+PUE+gBT
	Bl2wTPYy+M4m84nxeepXk+gzcCl96SgYjTd0i9dgX0O4JT0Os6K0tLI5yspKLQxBFBlSGr8h4jo
	xmAwtXsS6rfEK3tXc9vAkhtK5uYq1yr6cMdqLtqYOK6Nha2lM=
X-Received: by 2002:a17:906:240f:b0:c41:4512:560d with SMTP id
 a640c23a62f3a-c5049699729mr80819466b.16.1794286164826; Mon, 09 Nov 2026
 20:49:24 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <gm-top10-20261015191529-g65-295aa0ac5211@mhun512.gmail.com> <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
In-Reply-To: <KL1PR06MB694295F7F33B8FEDA284C65DF1602@KL1PR06MB6942.apcprd06.prod.outlook.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 9 Nov 2026 23:49:13 -0500
X-Gm-Features: AclHuK9dEbOFpKZBzF18DRp2ysCfTdn-dJEdIFaJ5Bm7I0rvJVmVsW64xtISAdQ
Message-ID: <CAGEsz8F3XkYkLOzrncnLVNHSgfC3tZ_zYdVrTR4xavq+h9anhw@mail.gmail.com>
Subject: Re: [PATCH] media: aspeed: acquire IRQ after reset and clock resources
To: Jammy Huang <jammy_huang@aspeedtech.com>
Cc: "eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Jammy,

Thanks for the review. I will address your comments and send v2.

Thanks,
Myeonghun
