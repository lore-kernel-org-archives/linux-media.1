Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794294689;
	b=CWEOxWXxJ2mZ55vTB6yFC3z4ZQcCHysZaDFWMZ0DrkTr2yf3Lkf+1BiGsAX/VVUc0AGP
	 P1N94gyJpzlo2oiIx7cC45MUE3FoRP9K3lwX6SJja76MnYlLZyr7r6QxrjBgbVNzdnpWZ
	 CdQ0Cp17CRtv6F+OiMgrl34J+Qq7vO3nxM26sFq6/yCRzGeOcdcofpWiyVuW4gFYg98Rs
	 bIaUCgLxKeT7eTpbBSKW29vUfFQyGUe3kFfZYzhQVKQaEHL0UmYdJhymVDvuxOYuo9GSH
	 JxkSM7JT1cIgEYo+uQ2ASOSuvkktbGwUafLYDfnm+pVFmIo1/Au1SEDw8WPbsiQWtTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
	b=wRrFw8KNB4LQnfgfWJTDBrIYrL1VtxlOV+HiTlzg9S0xsWsoZ5VgF6AhSUDM7tBZnTrj
	 kUJjd3ic6WWgXPSpF5CQ2z9OwaAu8hayVsLCP2CFU3Fc0hbF/czXO9OcADHYnqCL+1Vy1
	 LxdDbMbdnUqd2Ge78Vm82/ktR1CWPB+jOIthSSGlVxr5rjXtlaDWoiy1P1M4rMfEPIftw
	 hv0BXFPNOyAoAbEDaich5rIQnvOKtK6JFKpGdcUas0PDBTZ/LSaJFqtAh3TvB9S1ZXuHy
	 A5Lfi9lm5YzDTgVJseHtlwhbPT5WPDt0ZPa5jJOxDxPnlqJM8n+w5SK+fJK/NXJ3dEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aVZph5jn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7924C606A321
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 07:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7924C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=aVZph5jn
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798eb0d190so1362686d50.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 23:11:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794294688; cv=none;
        d=google.com; s=arc-20260327;
        b=GM5OCr94Y6GglNoS8X3RPun+RPGuHdJrqLR++oNqU2b1gXzABmb9GOAhFpfguYa7jU
         V1ZsZTnrfzEM75jEoelu2NWneUb5ldy0T2OtXpQoCjUsmTsc8NnoeydE1KXZAWZ9cWm3
         Q0THID3bj0nLbuZVNmI/PM8pRjQElZ93ZNvz6x5Nj0Dfb9tLmspodbCIgKavRRLhSwyg
         MKKqTywQhzSubGW7g0fbqnDQEeXcOxi9WL1j7eYv+400oE6AZYhOGss2jrY9YoDbcvUY
         wgciXer+fowD86zWcvAYzgWS3Tlk1SiD+KKSvsI/cvcr3HX1iujc6/+ChTbrjVw7f9kS
         MamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        fh=OVePb64PhNF4yR+ks5IL9vKUz/Ww2KvVfiv1KaOgiPg=;
        b=J8pgARzeTEJBwH/q2UmCdkz4X6QcyFxtO33vJT5XEn8ZIJnJ41ScM5lOog3rkgwhV7
         3a6o+O+7eKEInu7pYqqbhkJq4EHY+4XSYqrcVKGAjqL9jRw7vmIIKkESXg682ErFbqt6
         q5qAxcCn2cF6f4mSlVqez+17w31HGPb2YHYVmO+GsvX1QLIDVh5wQ+/7CE3PAoGOl8WR
         LnLbk54xdxhCvXR0n2LbtLRSHx4R1J5B2/5qKhODBZn8QUuMkqVQoRWYeCR/vByKq4hk
         fIjHd/dJetAXmKgX8egY6ozmcJM1KZo/JlBJ0u8/V4fBe4dp6rx6AmBIWgcs/1Jk/9zH
         1BCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794294688; x=1794899488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=aVZph5jnpz05+IInawFNEBG4LWaGyR6KawbNhlPio048THbmdlYy905j4OFPaX2CCj
         TUycftg6CzZQDxK7jZ7CjGl14d09h98g8UJxxBZ6lnP7g+pTrHx9V1Z+dDmU3/7PamWR
         6GWkClYFkHadDsV02afWsVL5zo6p8KbSPQ8vhwj7MNxvc2wDvZwmcCK9MLd1JLI/IPrk
         CgySYic2c1reZ/EjbRjPpjarqZitNvLUlTFzYU0NJms8wsUrOr5BdiS3VhMtbtebkDTH
         Dkhw4xDoARR+pWLPEeJhdn59fqCKzxGps/S9SS/2HAo6UJfiGQ71mi7wNQ07QvtkYiCe
         0mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294688; x=1794899488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRBGfbs2S64fL/sGXyZyTUAZ/P+8Vyhapa6z3k4bWvA=;
        b=hcP9HhKbmgYflj4bcXcjSoWzOTuwEJ6kyao+TuLct7m86WejeuvcQ2G6PBmHYhPROg
         YlRLAeZ/WPnay/unMN7wVwOAKOmRN391aM1ZMysPVTsEcIaDalnVSrHjp2t4DZA4it01
         cEoujNQDBoMONZHqAo2Vk+/Lfkm7xAzQqoE7jWSnsQWi2iD/R1qZXuJI5cumjNySSyaa
         REfrBzUPvtwthmlf8Vx2tA42T6h7Zo7mLnmdfR8Zw4iENCvBffHzzz8GEGUOWZFoZ16p
         SDk+cLUp2xLVsz1PeWrUUe87w0ExSUUSqMSrHvFkakw78FD7Fjiw1ss2MXzCcIUnrAya
         QOnA==
X-Forwarded-Encrypted: i=1; AL+hErF5olBD1r3c8tPbckW7cgfg95Q1nR9nKU1whLStP+4wK1ile/494L7RJlel1jEOK9Y2tnTmZNU35awJyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vvEI5TSOeaPBHjkyMG3Jw+G9jDGfJGMHJysi4Ks8IN6+cludu
	3tTt68adL7ZYr4lJBZqM2ekg3yjtzVUomsC9Rlkt52v3FJiH2YfbyLxjBkNajQm+kkFrsgSfyfd
	nj4wul8NhwlJkX1c3HtapUdqTy5u1Ch4=
X-Gm-Gg: AYBFou3NAFXnqVNJurZ/vKbZqivTRS6/mHYv+pzXwQg3lvOQflSRvkKiw6yMXP77jFy
	Q9OXEuk445t6Orbd6/Lh2oMLkUHbbQIf8q3HsobC0y1IHYS0U7YuzslOtUko2GzgNxLBFE+9HKW
	zPDc56iJ86PXeCwUWq9GvCpJZ/7KKKY4yWjMnklC40zxorXsFTRFAlljI1P7atdXrNvpSjl8fHj
	pCotbetjBQUkT8AJM73mBe+kQvXCyhiqWDeJZQZOENVtQyO66EgD1mBvf9J5/X7qwqm2tOPaZbV
	zcgnuLpFYy4A+9gDEW/VCX5CdDGESDePSAdqiM4VkhCFo69o5UmbfCsLc7djEI715NQs0XQQRaW
	D+CB6ErfojC7u0xIHlSmw+fs+QgB+QL+DzNBX
X-Received: by 2002:a05:690e:480b:b0:679:c916:46ed with SMTP id
 956f58d0204a3-67c56867600mr864381d50.65.1794294688510; Mon, 09 Nov 2026
 23:11:28 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106101954.46907-1-christian.koever-draxl@student.uibk.ac.at> <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261106101954.46907-2-christian.koever-draxl@student.uibk.ac.at>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Nov 2026 08:11:17 +0100
X-Gm-Features: AclHuK_6GpTQ67xpDENQByDg8QRKTv0ORuAztrJZSqgIK4qf--6_2HTmK0qNm1Q
Message-ID: <CAFBinCDi3m0gMTQBCd-yrCfAKkT0QeuXq0wE_i+CfCtS2oX+yA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: amlogic,meson6-ir: allow wakeup-source
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, sean@mess.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:20=E2=80=AFAM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
