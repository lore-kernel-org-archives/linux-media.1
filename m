Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794556464;
	b=o5fFJMgB1B4Hwbvu998sJ9Wjf3jNMG0CH+SeWPRV7Y9oLYJoOP93DUMLSLy450uVivNj
	 2fGTyi+bNptcUzFglYyUu7pEvzBgOwdJi1ViXT8GZuQ8u+m/eTPKof0d/JdiOxB3xA/9j
	 okjlLCIBRM92Q4T/IeVVLEXdfTTMfVKPGleacPwEhXnMeCxuzAUnEEmQVAcgqOZaXYcSu
	 XBJ7uT6Y6PpZ3TPf7PJ+UvD6pGKPjOzwbVoIPFILiWky4XTF38n36sDpUn6Ul+99jFu4z
	 tJJS9AiuFTnW7LdtO43GmAWq4zrOanO+jYYDE+VPyGLfoSs+1ZGfATpRJNDahdLm/rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
	b=MPWxoXMpKDb5DMpmKPqABkiuAfjY042Z38rpUdyxTNvtjLNElDBKFboMmDT6AUoNnyN8
	 SNN8+E4+1KEdU3qbeo9pZC2ZUK+BRVUPcmSCBkXMmgwWal/cllxX2NDHLNYX7bU/mwg4S
	 1wx+EZpkn4ugMRk7FI32m9IbOINFDz2vavvtrc1UqMuX4VXt5BDRrdA/AFAntPMVN5MDP
	 huQWLLRz9dfVOUvelKWeA5uUGYAI0TtEZUgySIigzpVM8WdIfZuee4f4/HVlHbL1ImpYD
	 rhuvN+Ak6mKqalqbUMk18Sb4DBXcQiUu7mjX0ymredUl9YcrBXGFmkORw02S9/T6tzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWBfalc5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DF3606A334
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64DF3606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWBfalc5
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso1352261fa.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 23:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556463; cv=none;
        d=google.com; s=arc-20260327;
        b=njCZXXP6DJAAoNDqnJ3jf/aoXJPCLZKTwIyIWT+X/4ktJPqtPf90Xx2fVVdWwN/awK
         C9UJW6BVD77TaQ1onzyd0VDpq7Dv4Vx40rFSj7QZfWgkIYP6+Q9W1BLGeTwHj5T4QnMx
         IsFRBvpbdeF6E/1B5c/+FIy6IljA4arXZNpzmfT5npv03h611lebHZRIJJugdQhFFobx
         qo8pvmOW0oltdBgxu30J1SOHjJx5CltM1cAEgvYs1fiynIyVttCy2CHxNpRruKHNgTft
         xphFDT0xm8yhNo80V34I75eQvWj9FovpTOCgIQFtoXi5Ane3pzWJwJnJNjF4+B8AKUQd
         fqlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        fh=A1Ze6HYO7DLr61AiVobpiSp6GD/MO57xzIM/yqkOho0=;
        b=qbhhV3dTt7sjNzOmfTwkLjJjS798xREs2WO0Ej6AkoPtO74zshgEnswDD5ugls8RKE
         u3F1aQReYJyEWuHpqkNtguhxXj1VynDg1TdpZFhiGVgKykSgTwuQl5esKHIe6qkSo2Iy
         mKp3aE+RJ2M2jWv+njw+7n4TymVq/j9oWN2UKkfsao/OYXQCIYtM/3aOqZA3MkAfLIqa
         DAMi7lE2PJP4sJDelIM82anYpjCxwy76jLJNpNfZYNgthuH8tlBc8DXvvTJ7Y8Mto7rU
         xus0rVWzBsZunBci+56zGk3FZPNvWtpIsjI6f2VEKOb9hGeDjjoCq2l7acEbQzMZXZEy
         5B1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556463; x=1795161263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=lWBfalc5odhHJQWPB0IRkDdkAm39vie6sBqtg8GNvSOoS9CHH/JhdjaTbIhIyVAckk
         GC3OB9V4gEMXN+jAMZPKOjBKUwtvBNfCBZHLMLPWFlZ3YzpBiIHNu7ovHm884isdQsVY
         CqP63Ase+zOCljdTJKMKuS7udyN5XNbtaORQGTZgVgSsPqnjGz+6+nUsQlEJAi0h6UMo
         uIpgGhI1fWB4yZ1mZLyTLJu2gAHkLxAT5Ygda7E7aNNiSzbg8tUH7yXumwmJQMVcoXmb
         cpygLUps/5aVKjZRECROZAlcCSnUSF6i8qCt1tPQgGDud5mnI9ml5bPRVixIOjUqthxr
         KkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556463; x=1795161263;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLWs2ipoib4sqkrDJNqUZN3ZZXCrx/V1Jn/vcRzhZf0=;
        b=PS0bV7N4P2bqK+dh+mvie1pXPKK9jLDzmccAbWOwfxutWCgCcmvBISk1ISbVWQVUui
         lYND8kdR+0nInAAZ7PQbTyLs+fNICQNxKA81wNVQgPWIdlNJPyyEH0wyXm84GUoHW+Eg
         LIKLTRZdPPURYmEQWkcVodfzKRsvHhwhaSUTdXQnd4W33dVC39HLvS+yRA3q/zlgddwI
         qLIwk+bc4ASBWZvp9oEWiH281YVI1Gxcd0UwvaUDSk16kybNmDzk0Ug+oUHNpu81M3bt
         zRVpTFqWuOiQfHt+5x4DVwgDoFTkPDSNTnlYMLpOZ42ynanEqufDvOpz+MDQmAiIqP2n
         UHHw==
X-Forwarded-Encrypted: i=1; AL+hErFOcHTBBCpCtSx+Ks6T+CVNF5krWOs8E6pUC4cowjiSLuVl8ed73PdE7+kRXHM9V7/lrlbQKos9kokwBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/KAVenqtiuBzufRkvh5uGIYl467+Xm6QpD1X65c54Imoul3MUb
	qoewe9ZTsYJ16GMNpz0il7VaBOC2NbGJblxwmo0AH+VUIbzsI1z1bzYM/xLcYhMX2DHQ0JQRRtZ
	pcljUkEbvIz11SlhYHcHRFMUrZq0KESM=
X-Gm-Gg: AYBFou1nrldWo0EHmyDMX0kWpkXdQBkf7z8i3Ycm9OvHQdMUQPR6EezXrdHJPfneqAj
	WuJijHA2vha4rR0hvoLbmM0jCf8sgHqK7H7303nSnRHrwJA2XgYqOvOrVN4qJUIrkEvQBgH0ptw
	OMX0PIizLwDWOfDJ+gZ7sestXclb+Jcby6zolp3mpLv4jzZD8lPr69EpJGMXYj09s/WQjL4XLvq
	novGJU0HAOz4J+UHgjkHERIuyHV2mTCoPGS2d3GrXRyB/trXs9C/YBkq3vXiaCQN1Ayd8s+H8mn
	D2MOfQPX5IHNuEcw9ZeceSKQjcBzJtaBGnmqBC5F6Z89pobfJ5N2Nx5sSs+u8s1kIuaWN4XQD6A
	G2qMzacp1kUBAV76ircQpf+1DXePL6sfBmwkZal8by8XibnfwLmR3UTOMy11sJIZDRJSICuI=
X-Received: by 2002:a05:6512:3da4:b0:5bf:ce1f:cd22 with SMTP id
 2adb3069b0e04-5c170434e66mr787433e87.0.1794556462452; Thu, 12 Nov 2026
 23:54:22 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
In-Reply-To: <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:54:10 -0800
X-Gm-Features: AclHuK-bvo5dDl4JVbgBvuOoQVFelHqw3mvt8zCrdDgOeg2cHm6xn5vl5OrzWyU
Message-ID: <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Le 12/11/2026 =C3=A0 11:19, Philipp Zabel a =C3=A9crit :
>> If vsi-iommu accesses require these bus interface resets to be
>> deasserted at certain points, why doesn't it request its own reset
>> controls?
>>
>> Depending on implicit assumptions like another driver not asserting its
>> exclusively controlled resets seems fragile.

The AV1 node lists these resets for hantro only. vsi-iommu would need
them in its own node and binding, and both drivers would have to move
to shared reset controls. Device trees without them would still hit
the SError. With this patch hantro never asserts the AV1 resets, so
vsi-iommu no longer depends on what hantro does with them.

> There is a side note on IOMMU doc saying that once the IOMMU has been
> enabled it can't be disabled for security reasons.
> That means that writing 0 on VSI_MMU_AHB_CONTROL_BASE register in vsi_iom=
mu_disable()
> could raise an SError so I would suggest to remove this line from IOMMU d=
river.

I only see the SError after hantro_remove() has asserted the BIU
resets. vsi_iommu_suspend() does the same write on every autosuspend in
normal use, and that has not faulted here.

I don't think dropping the write is enough on its own. With the resets
still asserted, the AV1 domain is powered off when the IOMMU suspends,
which is the fault 8e26d4c20ed2 fixed for hantro's own suspend. The
next bind then resumes the IOMMU, and vsi_iommu_enable() writes its
registers, before hantro_probe() deasserts the resets. I have not
tested that.

If you would like the write gone as well, I can send
that as a separate vsi-iommu patch.

Arun
