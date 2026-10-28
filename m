Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793220952;
	b=GgQFc/DNj11vGRjIBCpRI53I0ZwAG4iHyNATxPE2AqubUnQ9b3keyIoFyqQAlkjheK8I
	 cQsAEOFo/BeLJy+L647DlpNjuxxksgmW/hLSFy8vmwMUX8YD42a8f+10CpXBUeQZaDqg2
	 8PjJ1AqdK9fMnFw0Ku8ua/cLpmDTTelNylSIz5phlsopjnKsdZSvS69CE09WqmhEJ7E6I
	 BVUjpgNQjO7IGmSIMx24FY/C8w2RA03dk7TGqoKV1W8jfiVm8y+3DdsXRCn4N7w/boYss
	 m3z5aGAt8/9RfApswP1kcJWIaQqwpoXEAXy5EnEzrLVn3Vz8w/GCLY+iHklzNQzgcyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FqCotvToqRit0Ta4Oz35Sc8D8hyAm/wLhkR4LX3nbHQ=;
	b=fciWZGwf2ksgNcX4XB1SFwuUsQ/T9AOOU04WQzKauzi2nUGOlef4RHYa60dVirXfXBXf
	 7MQ/sh5unTiXe+upWWGxlICNb+F5FQJhGfWjNpTirvAA4sU6pH/4fDqrXW2EmYtkqsFkS
	 4ZeZZjwnS3oKV25dA1erObATQbZ8xlelbOuWSkPhtJJxqGUvM5xCA3vnHrY4KYdRoZHZp
	 vo02FeDoR3kxgeJW0fxaYmWjFqk+q9nrNnIZgDVZovU5f6FhxFXBEgqoMncXIRGKtWhft
	 kDl4KJTBziKCQEaa743d8bQDaqW+Fkslo3CK3aV1IgqK7tZ0CcHiqZ/b+m/KDWSCUhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l9bE+tTm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F71A606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F71A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l9bE+tTm
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018493d57so21415e9.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793220950; cv=none;
        d=google.com; s=arc-20260327;
        b=lVnTIKgd9sHaCsfv3Zi17gRUP8m9nD3jxVtZoEtdMqV8ifMTIGznRZXlI48MFBIwni
         rU+jjPSMEkYNoqZ3zMhwyOcopSa4KxnmuGIN2e0i7HV7JejSGH8viFcHp9GGYbqGtG7r
         F9BkKWzj3eZsrLYyGFNU4zaaKjXNcQKRmUXeqndtgadClQON+s5Pt9YvxaHt2kw5QIDZ
         cbyzuvtdw3/JNKLyaA0UiZS8LB9s3drpZJQ+Iw2RFyA8rmCebvKljomF/maRr4pWZGwj
         M9kKmE6/Bx63va03YlICrFqdVE/dCuRhDSIZ9KzRbywu0zS4SVn4CNFKpBTSYMVWr9vA
         nKuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FqCotvToqRit0Ta4Oz35Sc8D8hyAm/wLhkR4LX3nbHQ=;
        fh=aR73XoWIM1Y40QNj0El8lmwzMkDsLUbx0dvnkQbLu4E=;
        b=A7T39q8SMMeQDZsvoGDCU9o2oRVDLbHvr6NDkvt9H/Z7WddpE/5gUOZCbeqf8iDw95
         I+QFZzxrNAhWNF7uz23zxi+uoHzsZxzNxHYjlbz4kQa0CYY1Sg+mSIIpk2WVkvfvhEUj
         BapyjfbjIS7N2A3DKmRZGIkca+py45pWjCDdlTIaxoPXEuvxoD6pGmJHyizfK3eKOwv4
         +q0jU0dK8bpG/SxJdcEJysmxpMYrB1cI6KJJ4hnZn6kkKoaFefHW5D6qKjWQ+Fl7VrsZ
         ftCB5wgsCGreNAVsh9F1JgLSQbVV8l9r6P/NwoVloI5fu7AC0ttsD6JWN7xRU8z09fL+
         wsyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793220950; x=1793825750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqCotvToqRit0Ta4Oz35Sc8D8hyAm/wLhkR4LX3nbHQ=;
        b=l9bE+tTmHeCKBLsgDO30kCM66mZVPkqPCyc+mwIS3cBMWJBGkXtsFwTveEofksNE8o
         p+7SQWpKl/G7yGIW+NyknkwXh7RSICybLo290iYOw3eaeQsjeyeKe7Gkj3oev4bmCvUx
         qSZ0cQOPIgiYBxq9kI4/QkK0YhVoY5q+L/g4T/+IAdG4JIlSwUMQ927Pgm0CR/3QHHib
         jTq5KDsqc/ZeL3qe3k04LXM5sCWRfXXoMHrL+lJmQvyu6FptfSvYPkzkNKVm8gEi2fD3
         EQUuibKqHwMqW7NtP+4EnwoEffQfqqbycMReguCguiULfjV48B946r4oLnq0ItwiJf5A
         zs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220950; x=1793825750;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqCotvToqRit0Ta4Oz35Sc8D8hyAm/wLhkR4LX3nbHQ=;
        b=SkkzhB/0IdsvIA7j4gWNCLSWhOyG9xKZ5dF8oQe5+n0EMDpi3PzqcwCTysCA/UHwQE
         0ZwmSeo5rFY/VTSCGVCzXHTnodk2Cz6W5eVkEf8DUtWljthLcZiybBZGWSEAzwW6qEax
         t+QNQzkWLiNiDjx5X/bAAN5E1gVC3Qw94u11ohEUCpbqqJxRXRENIHL2WM6B2YP6a0Ae
         iLV7XZE54mt9QVN2XqKk9vyffuH4LvcVNlRGIXCo5QijrJmCMuM6Z0DcJdkYE7xf7lRv
         Tq/Q0pgdBupBeZfoit9XYg0xb/9QBCawf8iVhX/h3nHa7V9AOQknoKKqgqCAV5UfIgEh
         kUPg==
X-Forwarded-Encrypted: i=1; AKwUvBwCWent9tiTw8bBmbGOAgVH1Z0FBv5O0OeSEVP979mjp7JoJwRRFPQQwIBr7GUSsF4sJv4f1RLEZz/DrA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLu7j6Vyp20ONLsmV/X9hPjwk4oUzv68R2uSrX/9XAdYVqGPZ9H
	S7UuZauNE7/3InAI3zdb6rlmkPP3+1KubUE9Ieni0kqMrnip2r4odS6hEJctLtPej0pUeKGLBaa
	1I4vxATh+kAgn1LPd30FridfWrLQOo5ZexCoZkJGU
X-Gm-Gg: AYBFou0WDxqI9DOiC2sDXYwcL16KUnixw4nP8vjy6xUojCbmBz72VAtwkIvs3jVKUD9
	osdsdkwAabak9JmYDk0vQN3yBmubhg7zezUKBBhUbuon/HOwt/t0y7jpRnokrXDeCpr8m5DMljj
	DORvyybDY3rQVR7vEeI+5eo0ijqxd0u7nvrWm8Ka6dshKHtaPTN4CAmmF0EyC7GoGUN5oo2GK5p
	LNtWhqaoXosExc+Y4vkvMq/2iddcgEpP72xssbQpU/+i/WnHP3z8ik9W1AXKVT3KwOMkeREBobS
	v3xZTklwunoFlWl0eOH5okd75xP7dHOHsztEtKFJjUFRVTl6XklHjPBFT8ecgONKU1mDOfVloHQ
	/Ynh9zjDhDsC+yDiNFyLehC+CzllG+2nEL2FJOaG6+CwTZwPfmyc5hhv4z8jYItuscROE84E7bd
	307somD3robo//jx7tj3b/bHg=
X-Received: by 2002:a05:600c:3649:b0:4a1:d2f2:9fbd with SMTP id
 5b1f17b1804b1-4aab73beddcmr67845e9.0.1793220950027; Wed, 28 Oct 2026 13:55:50
 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928195850.1982569-1-dave@stgolabs.net> <20261007120745.bvhqqa6cowqnt3jc@offworld>
 <52a82bea-3105-4bb5-a6e0-b1a0e3b808b3@amd.com> <20261028145924.5gcjfjbjd2ejgozt@offworld>
In-Reply-To: <20261028145924.5gcjfjbjd2ejgozt@offworld>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 28 Oct 2026 13:55:37 -0700
X-Gm-Features: AclHuK-h0Y4xVklKo_Bdi3jnKsdQKwdLAyU1DW6GXSyu63AoyxnHO43jCYQYOF4
Message-ID: <CABdmKX28BVf3EWdpDBBefJg_9UFYOAwOK63n1vcpQrf2LZHKsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] dma-buf: system_heap: 2MB chunks on x86
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: =?UTF-8?B?Q2hyaXN0aWFuIEvDr8K/wr1uaWc=?= <christian.koenig@amd.com>, 
	sumit.semwal@linaro.org, phasta@kernel.org, benjamin.gaignard@collabora.com, 
	jstultz@google.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Barry Song <baohua@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 7:59=E2=80=AFAM Davidlohr Bueso <dave@stgolabs.net>=
 wrote:
>
> On Wed, 28 Oct 2026, Christian K=C3=AF=C2=BF=C2=BDnig wrote:
>
> >I've just pushed patch #1 to drm-misc-fixes.
>
> Thanks.
>
> >
> >I'm still wondering if #2 is actually optimal. From what I've heard only=
 2MiB should be used and especially 64k doesn't make sense any more on mode=
rn HW.
>
> I have no problem removing the 64k for x86 in v3.

SGTM. I think 64k is still useful for arm64 (SysMMU, GPU mappings,
generally smaller scatterlists, and for
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D04c7adb5871ad04c9e3fd645570e21c93f1b2f54)
