Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555023;
	b=W1GhL6tawPR2HwjjUN2ETOCn72PHz74DZmJ0+8rYeqoswDUfIhbPeyioFnr1ymMokqCN
	 9Zkqiam8s2qhcql99dqNFxsk4dzB5j9k+/lEQbUDVv/jWTiruZ26rwaHWD+m8ElPeoEDO
	 zrEqilBSWMF9NlvuBrPfoFrtp8lpdJ5HCkKdAL6AnmJvg4+bb4pg4GV0RFHiAEpOGxz+A
	 Ka2uhOHYPNJ1z5PPfhdom4X7oE57TiCiOzlKVsOOKvoFetQiF8ZrhGMbZ1fuqQH3D8kOr
	 QivWJJ0jSFqfjqA7bJwh1c4XL4PZ2S2aD7u5XPxXpddx8VYkbJt6uSwcRrdrgYTnjkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
	b=ag/MAakjDeqYsOenLCVa7lwsHx1R0ttX6hVZbuvr2Q9QqXt58kzW6RRBjs2BYLvTJFgt
	 mw1YeQ6uWcpw0rhJbIixx9NRQsb+GdGsj78yOB4ffhLHy6/j3s9Fd9SCLMBz2cvHiCt+3
	 ZWyUsGcejXWIgHpqzAFwXa1gk3vA21x3wJVm2mbAvH70pVuB3kqzzvERfbKTdwdF7EgRQ
	 dLPy05jtnnf/2/rw8vxRWYuVpH+A1IDk5ncNChXnNOJV1l25b6vHtLml/Jws44YTvW1vE
	 DYwC86M8f+7rTjjqNI88jr71TwCRYgFyW0Ym+cHne0vWYVBnK7XyDJ23z0yeBHl0W/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ENl3wJ3p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3BE606A69C
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3BE606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ENl3wJ3p
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so198085e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555017; cv=none;
        d=google.com; s=arc-20260327;
        b=iZ4O7ik5SXm5+SPkH59KNcjPMZbJ+piUywwnFJeH4IWOHQXj/cvsTR8CbIIap+OSon
         BgIs0h3cbiT60cJ8qKI7IOkix6f5ix/I6eu0wpUC8LZ2A/VsQ2WdC70WiLygZIc9+7Qq
         gWnmrGJdVBkTJ2vMu6dYC5tXYAXjxgFyciAtddiMlYlIyG/zn1u40plqqaWq9K4mGghw
         cW9AUOZ4qu5t8QQLQ4zOzKcti/6yny2OUNaXDxRdfJ8JlNdEtoVxzd/fh3uvF0UjSuZA
         GIjGVS9WjRPpOl57I0QpqJIwBUK/AwkHRU7dH6TcB+wsiatB4SdRaQFsMXBEUxnSpZi8
         wIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        fh=VAdvruW3ydMglXh/fup5gx8NJUOsW+X/uuQQU3yeAWI=;
        b=Lz2mdqhP9NpzcGnymVNuWrfSW+9hJ79ynngpY4+jJzMpr8NTKsJX15OosovVg+bBFu
         cG97dmocyxoHznbXQcrxy/ooaa5lavfqan4m1PhWAD/aqjRNwR/WRUKIcz/vPO+kkHGo
         +xnxPA8Z9xvwcrLcB4HQGFGhmg4xL/7Q1lGbPiRIa8gSZd7NZu4zfG7TXAP4g6FVNJm+
         KLvNVh07C9i1TswtpVkfdM8zXFHJ3aJ/ATy5Tld+FhM7nDHE9Zav8MYO9Ugc/XmnAsfP
         x3WYGK32QLACtgo7Ihy1Ws5LiZD/L1eulM41ybt2O0zhBx51tBLNJ7CEVZx/nTJi5WUy
         qJMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555017; x=1796159817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        b=ENl3wJ3p+Y/a1SysInSkiNRSJDmms79EIC1Gkrn1nJiecehtRbXtnZFv4RVHGWeN13
         oWsVLtdFGhxNYxm8tAQtl8LKZYYH5DKN4Rk/BA5L2yx0nJWokwMaTGXtMQvAWjKHD1nk
         CNM4bsZfr4zXqABXcPLWIxsw3Pg05osVgC5379nRm/Ljz8fpfCmuUL3S/JrmUrLN1kSW
         raRZHTuCtpniB5nXyv39eyBmOQpD894i0FQVqE7OuWjeMYjHbHKwufyXmPLo8SVoyBcL
         MuZgXoDc9Od6HIRKwTDpEdOkL6gcOlpyT/+z754mu381GCP2poipfujua+zr/3Alx47V
         mCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555017; x=1796159817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        b=lWyHWmGCibxYoSngF7Cz8nRDoDfd7nzh/wAru5teUCAc8hger0RmsqY1oLXT193F2Y
         u4mqctiarlR+SITMiKPc4sYbNwTFT6g8mkaUoIBAKHvoTsttw6JVAeCPQJ66RfevtBnO
         lz67OgAgdybSmiM3WcjdxI6haQRkh0MaJ1KPa3sSFPF2yzoEfULH1hG3V3n5e7PtVntQ
         ycPLcU6vGmEol8laV8VvLHBe5T1UsWKj5hRFe4vwZ/1b6jYYiuQoXmkSwWLAhnHLwS6E
         dLzm9++reiVrPwa8lAqw1l+SINoRO7bdRc4/xcBmRG28m4D0rZAe23Z10hdz5ZM3Vr0y
         Kbbw==
X-Forwarded-Encrypted: i=1; AL+hErEXNAo0WIrwvOb0rDuC4GPk3sWlzKvGFJ4XnM27y4cOL17Ys92PHJUQ0pIMNSgYVpjJ18ltkEFcVxzfng==@vger.kernel.org
X-Gm-Message-State: APuU4Z8N7L4V52aIQIGS3xWDsLxv8K/Xe1Pa35CLO1o3qM9QSHLH9EQZ
	mosfYtK5W14L5lIjDkwHnnJUrbrNgZ0BOUyrev/iz2U35PfIXiBsKTP4xnW/3qe4ndUWmvxCPmy
	+rZ/E8X3gijH6m00ZabV/rU9zq6gCQk8HrbNqfEGy
X-Gm-Gg: AZFdTZfSIQ56URA7IZUfKhAajmLhcFSezhBaTBi4Dy2AcQYzdAAqb2GF/SlvawZ1lA7
	rpT561i9MUhhIDU+FPjvGvOUoppQQF01KThZwCa0GCUdRzmFlgscsVMgfckqY2Pjqh1zv4yZSnh
	0uBYSK5a8BcYNyS1dKgJ26UzErYOTV/PmC0rLfURn4PNr8dGb867jQpYKHeSVfQCcdx3Nw4xbgf
	hDYkUJ+LPOVbqW+owRNpDvp5r3MKrzJ1uEz8o3q6/7M9Iw+kjP+qn0Wv2KnXaHdq9Vppr9v2tBI
	pSN05ooUr00X5dMLXEI0zcHhKXE5WwheSLPrzZskp/4VG5ixhqVyGsw6/D+19JTAHSp92sz9Wuo
	hAZ/I50hh/8qqr4HBZIRkGcF8BRS+atHnE7/R9/9SWrLxrk2Ww+ahm9ethiDRf07n4uLnlaHOvs
	vStmnG5MD8sAhBisFn7+kMTQ==
X-Received: by 2002:a05:600c:4f0d:b0:4a1:a48c:17eb with SMTP id
 5b1f17b1804b1-4bb916369c4mr5002655e9.11.1795555017146; Tue, 24 Nov 2026
 13:16:57 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-1-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-1-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 13:16:45 -0800
X-Gm-Features: Aa3M54o_hbLVSlOG7JsmOAd1qF2KuaOISZwlNoGrfoGShDk7KQSGd0nh9FrptyA
Message-ID: <CABdmKX3_4=HiNZnurUAHcrY5hkFLPrLer-q6cV76FvmJkikmYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: align large mappings to PMD boundaries
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> A dma-buf exporter whose buffer is backed by physically contiguous memory
> can map it with PMDs from a ->huge_fault() handler, which only works wher=
e
> the user address and the buffer offset are aligned alike to PMD_SIZE.
>
> dma_buf_fops has no ->get_unmapped_area(), so mmap() places a dma-buf at
> whatever page aligned address the default allocator returns. A 4 GiB
> udmabuf, for one, lands 616 KiB past a 2 MiB boundary, and then none of
> its PMD-sized ranges can be mapped with a PMD.
>
> Use thp_get_unmapped_area(), as filesystems that support huge mappings
> do. It aligns a mapping that covers at least one whole PMD to the buffer
> offset and leaves smaller mappings where they would be placed anyway.
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
