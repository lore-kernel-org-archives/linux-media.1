Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644BA283FDC
	for <linux-media@vger.kernel.org>; Mon,  3 Aug 2026 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763306; cv=pass; b=feY/AxRSgNRLGIKfUqg4TeRULbJlb57uL2xQL/eaFBFxK/GJBUDX4YLP+P6mPdyC1+RAnsP/NiaEUCG40jxYARYwx+JPFg5tlNhlZkYAS1B37uUvHVa4OugMZyF2aWlQKB46TRPUsBIK6W8xUltX9k0hY3q7ujqUDqqCAgOseu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763306; c=relaxed/simple;
	bh=Pgl5mTcqFOqWGOQn2TZduStirxwuSm2pRwIjZSucJwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liWIhQuxCgSlTkNQquXb7zBieUZm9gKIGyykfEmcwmER6D2xlmWDY59m4HYhdTG75WaU25M4E9oz1TNW2yidfA8OkEqltnm1ZcApJEtzSW5KNyhiBMxX6lTZ5Nn68dickIjXvQ/I/fUXv0dZOFKyo2z4WADptPKs0ExJO8Y7KpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvxRm/Zc; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvxRm/Zc"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69f2c67650aso5274521a12.2
        for <linux-media@vger.kernel.org>; Mon, 03 Aug 2026 06:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785763289; cv=none;
        d=google.com; s=arc-20260327;
        b=X6h9c1IStWVNUY6lkj9maisU+oa87q6cenRuZyWa+r1KUXNMo73lcXJW8wxEml/bJI
         57QS/ltaKaNXRG0QfJumJZdVljuKCdO/HfZUWOyRr5gTJ1kQUad/y3o2Tw11wLiHemWy
         RNAGGyrRcgyZXpeNSEZsnHvY6WiVTn65TIE/y7mJicB6ZnLLHC9DXbDOqhO9OSwyd1be
         8H5CH06QI7RE8tniCxACDdfkljXArkwe35zuwdnGrsWuIOWTrb8FSeuvmL60ALboMOoz
         jMCLCw0bsrYL2LLV848hAaSlowqedTbCiWyIMlnFh8V65tMI+ersiBfKYCKAFnW1bHZJ
         ZVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y/+lXFVTL8yRFLlIHwc83PXR9zbnjKq/x3zTQK5cH9A=;
        fh=HhgV3682dKxxw9BU5l+vajvYCWCaHTbIBzv7fXjUF6Q=;
        b=W2cpl2e05g/aS8kqYhKO9tDdazGpjDODM1TVViM2xQxZXk+52R4lgdKFsKrFdTXCB0
         mC+805KfS7vEzILJ5m9NIiB/zZyNatNG5WcBk0gJPIGnuF2/vvnadhYbcO1ro0Ku7u7k
         fzHZ4DbTUKGqShelvZwv5uQkfmWBH1Uf8u1KxhXEJ5oPQs8nD/CfjPEyL5d37eWMCjg/
         gS00ujbTvdPP4SNMOh9gSaqp5h1T4jmsBcNz9nene2ozXCkN+SoWtQ+pwxIYZCalyCmZ
         pivz3vH0KYShn25UE+tw354zReeJMFj43vcaTwX6D9+xWOcNx194xQk4fc1BWDOXSjA0
         9KBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785763289; x=1786368089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y/+lXFVTL8yRFLlIHwc83PXR9zbnjKq/x3zTQK5cH9A=;
        b=dvxRm/ZcGYR2VElqHNvrbIbP9OvHsQkpvLJObV5wRx/fXOfUt29OLPtE+JvxWK2AOQ
         3VhaxWdK9wr8VU9F7OpdHh93UyXYln1zJIFeKxpY8byuq8uH5aOk6evZeGjO9IkqTptd
         6pqSXC4iIsTM5Q5hI3ihgFCpFYQmHAIH17jBmK2nWesFrnXCN+cLlB30cVLoPE7iBxPq
         YNZUhtvw1JycZThdfbfdyNVwsIyNlqZahx8PqEto4vhXRgRne7m4fkHUxVzQMxB0N/A0
         77oJ0UDkdALZBQIED3QKAmbqVImouGpGGwdcCJe4RsLDjGD4I5xyy4Jr8+HbjvOIgaqa
         GxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785763289; x=1786368089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/+lXFVTL8yRFLlIHwc83PXR9zbnjKq/x3zTQK5cH9A=;
        b=U+BY7JmLaYOfI0uB8UBUDIsJ9sOB0OHVnDyo0o6+NSLbyhzu6ghpHuTuTfwcev6xPW
         aKUAOdK7crx58bxBeos/0MHikNUtJjS1M2lwKkLWOFWARvRyI0awpuWPoMcZUFT6+Wku
         qa3SMlfwIe1fU9dW+62sE6M3d4mRYj+lT/kcJNyHVtT8Rjly1LsnpTNY9mA6D3ipOo4v
         eSU7b8f50L7vabnGjiwm1POTZFDk/NsTJtich/5EGOUxrONd9OBO6rYyRUvsGSB/2ym4
         GwA5LpLvIO8qm/iLoNMCo5cFXhET9POaV5KwnnXqAerBYM3el4LuSASSAPlCfK00dPby
         NDfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4Y8UezYFmm0AjuldqmGPGREBdADf1rMGAuadQ8UO+So6B8MofLn03W+/4hbSEesCzCi53y1Tp/Q5row==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzaizfef4Cn8t7B9H69Zh9BmnVXVR5v782tzqvMJOwZueTMG1C
	X0jooT4abWWavM/dONltzBmJ6zVSP6oCNh8r12F4wDHoiqoM3h8LPv7nx9zbMUjOcmbZJ/jfUGC
	sODSwhi0JVIdZpySGBPINUuh5L7gg9g==
X-Gm-Gg: AR+sD123VTfFqizp/e176xpmCzS/jWJGR1T7VvtUU/nXcVfmudwbtU3AJdFWHAj8mFF
	KjhDyddnWgZGQoxCFP15nFt5OimxHDTzYQYMmUwNNCMNVDAtwvkZ+V8ONQHq3mLktX+Kk7kbNxt
	e26D9IuuwDB7Qksq3G0r0dlJzB+2QsZBRy0A1OgUlnR35xDTQmaDlEGq9jgz7UiycWS6upy/Kc0
	dxAnHbOUN05FT9CmFFCRVVM2Z1h3cU+L0wZ/mEdPJeJEf6WGhFUoGXoEKiS3nsLZTGoWvOEkuAX
	2V1qVJFTbDAPQAQcH+leU6TLe0ccnXx5ZQfqMptiqFAxrrFewS6/10A5F2t2olLB8z/nUzJOzUX
	ciN9gUPKX5oAMlUU=
X-Received: by 2002:a05:6402:21d9:b0:69c:794d:4862 with SMTP id
 4fb4d7f45d1cf-6a0a7c614f9mr7875783a12.7.1785763288576; Mon, 03 Aug 2026
 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1785596451.git.asml.silence@gmail.com> <c1ab6c0db3853b339a89aee0b1a9c5ac0c48b79e.1785596451.git.asml.silence@gmail.com>
In-Reply-To: <c1ab6c0db3853b339a89aee0b1a9c5ac0c48b79e.1785596451.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Mon, 3 Aug 2026 18:50:50 +0530
X-Gm-Features: AUfX_mwnLWCAPfRurFp37qU73Xc2KDpD6en6Q3cA2kgelroMq6uNFVC_YKEZqSE
Message-ID: <CACzX3AvwBF32_ODomei3XHSZ=KtRaWLN-_Tfkwv7sV3Ssc3wmw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] iov_iter: add iterator type for dmabuf maps
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>, 
	William Power <william.power@intel.com>, Phil Cayton <phil.cayton@intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
	Benjamin Marzinski <bmarzins@redhat.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev, 
	nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	ceph-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 9:19=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.c=
om> wrote:
> @@ -841,7 +857,7 @@ static unsigned long iov_iter_alignment_bvec(const st=
ruct iov_iter *i)
>
>  unsigned long iov_iter_alignment(const struct iov_iter *i)
>  {
> -       if (likely(iter_is_ubuf(i))) {
> +       if (likely(iter_is_ubuf(i)) || iov_iter_is_dmabuf_map(i)) {
>                 size_t size =3D i->count;
>                 if (size)
>                         return ((unsigned long)i->ubuf + i->iov_offset) |=
 size;

dmabuf_map shares the same union slot as ubuf, so this reads the map
pointer as a user address. gap_alignment() below already returns 0
correctly for dmabuf - this should too. Checked the rest of this patch
(advance/revert/restore) - none of them dereference the union pointer
for dmabuf, so it's isolated to this one spot. Doesn't affect the
current series, nothing reaches this with a dmabuf iter yet.

> @@ -872,7 +888,7 @@ unsigned long iov_iter_gap_alignment(const struct iov=
_iter *i)
>         size_t size =3D i->count;
>         unsigned k;
>
> -       if (iter_is_ubuf(i))
> +       if (iter_is_ubuf(i) || iov_iter_is_dmabuf_map(i))
>                 return 0;
