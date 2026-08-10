Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A923D283
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786341648; cv=pass; b=gYWm8gui5xkkeXgTNcEnqXZIXU606vIzkOVOQaERShgKisRnx/omWJLWjg4u+B4j8kMiGekTt+6CtaPD5M8sBHaQgcSGroHvI1h50mm41ynlZIKuRvrfU46ojDDHWE7GnpoKVSeS8OBIncAzDjr5HKmY1SLwgz7nMz2QIOKvM4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786341648; c=relaxed/simple;
	bh=A6k/r7nYTVXUKSwr3yMiCfaokYfSJx1y4Hc9qQ/TqEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCBuwO1erqUVpaMtdJK5Ybjo9oZNV9oavP6E6BduVKJQ7IiCktywMmTiKEBn7qpVFPt9KCIroHtEliaNKnm0YiRZrHVYKKmGP0GZQrJHmGsjiNgdB4EbW72Hmx2ucvHx5i9qbyGUf1DUD0EjNvMTk5K2Y+wPJF8XkYndwqA0TXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jj7M4TRY; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj7M4TRY"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceeee8c46bso4548545ad.2
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 23:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786341646; cv=none;
        d=google.com; s=arc-20260327;
        b=b01Ee2qwHTb1XVNEA21e1QFa851dmnXiK89OnspBbjfqHYZABcXf6bYhPs8b2QyNQx
         tuJgQ+rrHFm3+Kz6QxmObIES9gAa+eBM+pLUgKkvLIiF9Vrc8uYDy6D0EyADTYC1vuke
         S9je9EsG23fAOw1+xVCCOERdVBY8d7oxzsPloY+TUtDDzH1IdSU0IC5j7mUo0GGlhLey
         ECjjYq2/L2nPPfu3xFfnYqCUXAp+UHbNYrVyR1lASTTjgvExlzorfMpFQmGZ6QOlhToz
         iVKHd8X/OhraT9f/iQVKqBsv0/uFZD3J+0Rn9ZnYGHLLFPJM0F0CK70elHHHS55fSTJy
         kvPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/zktKh644DXHbJuaAdqY5YkWn6ygQvUdVRJDbRh3y/s=;
        fh=Lc8Qw5ji7mvikhO5RxufPEObmvoeLdRU5i4IDjKU6IE=;
        b=XmNHDSYfxhE5i355SSy/xSTyqk8MWm+XpAapfPP3GCuSzxCXA+TTkpy1jev7LKyGSm
         5nVKV0pOuGcRo3qDaCga4xlBSBchzoxhoyjbMASif72q0/GtD8S8/oPMy9ZdZjkD7omX
         wOG6TWSVeT09Yrh0oKX9yaMa+p9d7fZTfJhJH0h30+T+e7NxpymFnvdK31NcBv+CnKjo
         qbr2dEFpJpIrp03dH8dVqUTtSKrNrA7E5TZvV5lv4vqWG2dgxTpNKfgg1Iq1c8u10js6
         1zA44Qkil8pwtJZw48F5iai+XCHR8zrrqA2p6aUqwqIBDSfZbpVECEkuDCEKlCwwiPW8
         Hx2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786341646; x=1786946446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/zktKh644DXHbJuaAdqY5YkWn6ygQvUdVRJDbRh3y/s=;
        b=Jj7M4TRYDJ7SXuZrD1ZuEtJxUuBtXt0KeIDqTROjszR7K/cwe2zxn6IT7OP6CymHui
         Ls2lHZJqZ4YWRVbWGRZVtLP+0MJzjNfwnP37iF+Fwyj2b9bidC6g/qoVVQXjiuCB0kRf
         xL+vMZ/yQmd+DOx1dgjnCmgf68Vu02f8nayd31uJ/G+hYK6EjLYbaBqoJ1EVXhjTzAyV
         220xatziRAEhCek5X2+fK0RXabPpiOi2DSzKLjHb3JH9+4DwW61UhdkJAw4Z1nMo/aX1
         cCa76nzrlVf7lycK/ZZ/gsFGywuvJAlVe84giizY57koLP0wvXCn+Z8kc966xQDVmG0t
         gPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786341646; x=1786946446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zktKh644DXHbJuaAdqY5YkWn6ygQvUdVRJDbRh3y/s=;
        b=LDmU3qEOOH7W7QK8zDb9PFOnC2Fqeizn9OiRovltyR6frmMLZVKK+Oeviy4XfMAyoy
         kd4tIExOlQ1LGCAVQIBlmGfok6Avb3YJeTJA3/8WQLaZe0OkdWqGR+XenIgCysga13JO
         HZqPZVPnI49KBdpNI1Qxr9xhpofLjp0wd6ffWch+JJtllgk88rJW/+05g9hRvoi8PE7+
         FvBbjhAl3wyv91EoZrf9ZvGYIBcfee6cjBZiRcJpCemIwgAXdzubHtrgKFVEPdLOtRn5
         TsfJ37hDj5CbRdRAqw8t6gNeY8C5s1FBK/aVs+Sdqwyoa293ScMrbFm615WPDMAbNpkq
         VXKA==
X-Forwarded-Encrypted: i=1; AHgh+RrmF/bvaRrb0yJFDI2R942+okY9kcPOAxxTEqGm0j5YLaLDnaGJ6rcNX/eYP73s8kafq8Hv4j708enLWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMqy7X6bPFwGc/wvaEXeirG3CXjr0xf7zCRgUqenELJG99KkUo
	AjR+UeTiwWaq1P84HA1FE/NC/e8l4ny/Fhc4RSAvZLzY5naNanXfOvUTH5+kT2YQFzA8PALRA4k
	P933IQ7xoCLL7Jvyp4KqYM1BrWXHjhmg=
X-Gm-Gg: AR+sD12XCX5JhhkWKnaDLeMfNUO4DRU42x1KGJVd4HI0cHNsZFX6rpeUPgeKw2F4KWH
	iY7hpHRCPC7qiYY3hPjaNQkVWVe5vWggZ3iY7t8bPNMlcOijy9lSs2wFdD0C5girykqkCo5Knjj
	m7Y+LWs+cjxBZqKqzEu1HlY0MbSR+fBwfD8ZpZJ2SOVvhY+JF6vkmQroDi6MKJnXgi/tUBlHf1Z
	wGO8qqlJTWzZ028kEg7Dw/TWwt4Go8N9SGgXz0hLVMReqUlmEqw9F+vFm24oYEvzVEdGrhaK3dN
	21ek9pBP5f6+r4zwbFMxR5b7jJeaIHeGP7sSNvPbE9b2Yoy0PW4O5Ta2U7MciDLGxrtwoX5ffSV
	DHYXVxG+kHB/PkRh8nhxBLuVxkRbi+DFon/TAJen/u7jaqb+phkGbvAsCLI8V
X-Received: by 2002:a17:903:1b43:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2d0ca9ab066mr333546215ad.2.1786341646217; Sun, 09 Aug 2026
 23:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805145949.938505-2-phasta@kernel.org>
In-Reply-To: <20260805145949.938505-2-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 08:00:33 +0200
X-Gm-Features: AUfX_mwcm7oQ_Y3CUbVf59t9d9A6DohexL7x3OfKArvNRPUGCPEC33TB28La-48
Message-ID: <CANiq72nZ25wkxVHpz9GTA_m5E_vyBmRKdDSUNMsJAZ=6zk=zhw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] rust / dma_buf: Add abstractions for dma_fence
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Lyude Paul <lyude@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Mirko Adzic <adzicmirko97@gmail.com>, 
	Timur Tabi <ttabi@nvidia.com>, 
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 5:01=E2=80=AFPM Philipp Stanner <phasta@kernel.org> =
wrote:
>
>   rust: types: implement ForeignOwnable for ARef<T>
>   rust: sync: Add abstraction for rcu_barrier()
>   rust: error: add remaining error codes

Applied (these three) to `rust-next` -- thanks everyone!

Please note that your Signed-off-by is required when sending a patch
from someone else:

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

I added it here on apply for you -- please let me know if that is not
what you intended!

    [ Formatted comments. Added the submitter's Signed-off-by tag. - Miguel=
 ]

    [ Relaxed `'static` bound and added `#[inline]` as discussed. Added
      the submitter's Signed-off-by tag. - Miguel ]

    [ Formatted documentation. Sorted tags. - Miguel ]

Thanks!

Cheers,
Miguel
