Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555042;
	b=2jRHd3gEV/79iQsxU/9wt7giBVpxS7dA87VRXFTiLxAP9N6opQvAkh2oMp8UXgFezOEU
	 +scb265mH+36wTkRzfp6ZBfqONkbWVJUV8OPgxB09TW+f7gLtXzx+QC8VV0tyhX8yyI2w
	 pILQ0g6aTLUmWMK74XpSJSNGrqFyr0M/kBwcYOHhcYZEADrGHGnfXAqsq4SSlhZpfgrek
	 x40mSNKrlMZCpdzYl+4gwV2kf9VSj/f9PeSRw4jT8OKuTzsUDbVa14rbhPjQbLaAArYuI
	 Z0nSOsdVsCOOz2JAgDB/+l2BGtygc5efZPvLyegVLrH+PMCXAKAZ3m5MCpC69diL5Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
	b=qdJOHnMxnur0dkjRtTAO4qUV8Meqw9hvArusg5mU8xCwPw3oKlJqSEkHVe37yw/mjxFe
	 mtrxqEXG8+K7kV5jRD9HAqSBI2QpXytlXIYOvLw87OeQd852Pg5JrqS+oilLcWW1En6p6
	 z0+dIVSy8xzwNeJZPx8EykQRT9ITOQCXjaATIb4/m7R8Km1sIHnFqHLBWbNpvFXJGpXXk
	 eGo94E7f59oSP9vsxcGJSSshqUcXYhvPoPzbJQH6cjKVqSBSaCO82lj/6pOfsgLRngqHC
	 +KD2iuf0HTX6cFYl6gYpuLjhGFZEou/Do0V6b1NPXTAY+N6vYU4u0Y70gNMrGdrLwkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="MkSXuN/x";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DEF606A6AC
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 21:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DEF606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MkSXuN/x
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b33e2ffso133425e9.1
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 13:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555035; cv=none;
        d=google.com; s=arc-20260327;
        b=eeuwvGFlWzstMJKbtwurGmwRU7AI/izx4l4f1TsQQEnDEwodL6uMKWOYYdYfGtRyvI
         zPPHRXXt+mk030D1JXq5wj6XBZDxbBqtZWRjxJlK3hu3DZaetEpbH51B8clsWthwg7ki
         E3fdBrcTJ+Lk9RoM0AqICpRW3qyR7KQVJNZo9q3lFqjt4zyWUXpageQgf3EaUhD0XGo5
         T0PfPhndWVbgF4AJheXs3xBtcFryBX/Rp+4m7CMqSOY5pk/Xy4YJaftvuYUfNEcam2Ks
         I32mNDvSwNatKT9jtH1eUGYl0rqGUPRDMj1zbkGCTV8v0woZVvhHMvNMH+ElXn7wgdP5
         oE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        fh=JhjB9E8fiOGR6IrsYx2BxOsYi1dnL1kxf3zkk5xC1O4=;
        b=qb0XkfoHkVHmJv2zUU2MtDsg6Yq/BLX2lR7u03g8yUtQIy+dCoUuWrnWeTSe+u5+Y0
         K+5X2IotED+qtw9mhk6gNi+qr3YOELm+/GfYgFppINRANLNAfaDfga4gMAya6uIPtl/P
         K68cDCTzc0YwkNVxGI0iKsaxHhbN3S87kUgaS118HiaTuRVjiI1CMwB3thRJFazOfQEb
         /WhSEylFEzSxtNrtc8TxNF951ZnuU4gM5DC8p8ZKFpSPxDHh8SbBueVMwDhs6LDOQNuu
         mGEO5syIeRDLmKiPa+uzOpsnsHRs1NwPahxN1VjPKceJj3V9fe3Y/kGK3GibFntJFL31
         BaUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555035; x=1796159835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        b=MkSXuN/xdTgpLprAaYeg0DUZVlUmwLE3QyG/Oo8oVmOu0/SNd2kvpbkOWXVN5tgQh/
         TonNMVSbIqyueZeYUWRvcXD3n8lMbaOPzHucCw66VnV/LH2wUH4aW7EcdmciDE/Y5OGF
         7Lxm76B7Blpx0f45YadbB9p2dBDewxo4/7zBOn8EzOmrf9MLEOlMXJbG5HO0oRQCq7YT
         28QZU5IjCmmthE6LYlSlZ47gSKWC48k7RdJeZWUgSM+3j68zeX3q3x81pyxQGYt9pyxE
         vi7Ya8wNILGVLHZ5pNxnANCRtCpbTuA/1AwQOeAUUbo1iZm/h5ijkrltUGAxvs2mLWRr
         IfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555035; x=1796159835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        b=ReJLQHvv+3AkOdJt/vlWBC+QgICr9/+8LRTRMZa9uJyEfDlMdEgOxCQoDuy89X6+Mv
         qnnXzHTQUTkD82jJbZ4yTVZA23LSQEdvoWQ558acVS+YS7MDxFobDwAyZjGywSnH4eV4
         +kDOyTgEwA1E9QHLIpSTvXCirjvwjytFzzWONJggF/wkZynLb3jWvwH5Kg1PlTnKoA3Y
         UkviMXUw9DJ3tNyWYnavlok4vPRYV8vmBYrd/ZgIkjrW7Js9HkrlDEon7b9EkmZGXxjk
         CcgCyXnbjdrnXOtO6Dh5cCuiU6ShWnMCXOLp/C83aZ6TLGkYzcy8p172uJk0zUlXcmW6
         7jcQ==
X-Forwarded-Encrypted: i=1; AL+hErHOY9nr9hr2K6UHZNiqlf/w7EmKf2osATqAoEy5Lgo+qH6veUKju2Su4LkLf6VzjioaeAl5y4/RGUvVYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ny5r8GZINulCNHzINfXdtzmTtEQchNF1PQa7H+h87H/KYUCLX
	2aRX6R80tN0zCEqjH+q2W/Zn4w8MQ1v/H0GO19Gr6vvSbejZR9hLwHMChnuO0Ahu9JOHfjQ65h7
	9dYlXgUh6PfQQpsrk4/sOU6bz8HPZNg5sIGS07Jre
X-Gm-Gg: AZFdTZdY4F6QSbQZpxDwdmBaRpni8trVngyx/AMx6gxGqdquTftCsaHPicG/8skLrz6
	XElfZdW6Yn4Tn1b5L6Qek1KVImzzPiBeLOhdYUnO0kEkfuNmA3LMQ/NixviMu3yzt1DZHvBz/+F
	r1huFNCRXg5r/09FEs0fkq+Sw9dKx0UC8OgLNeMDV3BqqrLiOgZEKNpK3AJ/urLdrqNHSSAgApd
	cmqcpHhJp2C8dD5VRmInzEKfDjhAuwQZvRoroYZbQ6FPxg+4n6GLU88RFgRh5SzUXxSrO8qYtZ9
	ShdnE8R9NFP5l9H6Zelb0cX/tdR56oJkgzomqA8wmiK07N76yVQtOIscdPGIiUnpWSK0cER4R8C
	x0pdYCI2f3to++vOaylTcWRV68vyiOnTjLcHrXmoeeJweH6eSc8juhq5H65w8jOBo/ei9pcM/+t
	UXASrF0FU9qof4XAkC+pYNpPAim246kR7B9OJAjfqfoG8=
X-Received: by 2002:a05:600c:41c7:b0:4bb:7ae0:3158 with SMTP id
 5b1f17b1804b1-4bb91683f09mr1702525e9.8.1795555034613; Tue, 24 Nov 2026
 13:17:14 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-2-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-2-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 13:17:02 -0800
X-Gm-Features: Aa3M54oDsXG-xXA0liYSlMAI56IBmdX9Wf6SVnF95VXy1mB4cBPNV8817l0bAvI
Message-ID: <CABdmKX2156cpvWHEg7hVNGqqhgg-+v1Vj4G_bAK01kk6huq=4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] udmabuf: map huge page backed ranges with PMDs
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
> QEMU and crosvm hand guest memory to the host renderer and display as
> udmabufs for virtio-gpu blob resources. The guest memory is a memfd that
> is often backed by 2 MiB huge pages, and the host process mmap()s the
> dma-buf to access it with the CPU.
>
> udmabuf maps every page with its own PTE: the first fault inserts a PFN
> for each 4 KiB page of the whole VMA. Mapping and touching 4 GiB this way
> takes over 200 ms and a million PTEs, although the memory behind it is
> 2048 huge pages.
>
> Add a ->huge_fault() handler that maps a PMD-sized range with one PMD
> when it is backed by an aligned run of contiguous PFNs, and falls back to
> PTEs otherwise. Have the pre-mapping on the first fault skip the ranges
> the handler will map, so that their PTEs don't take the place of the
> PMDs. Once THP is disabled for the VMA, the ranges already mapped with a
> PMD keep it, so pre-map only the PMD-sized range of the fault then.
>
> Mapping a udmabuf over a memfd filled with data and reading a byte of
> each 4 KiB page through the mapping, base and patched kernels alternating
> over 3 rounds of 5 runs (7 for shmem 4K), median of the per-round medians
> and range in parentheses:
>
>   backing    size        before (ms)         after (ms)   change
>   hugetlb    256M   13.3 (13.3-13.7)      1.7 (1.7-1.8)     -87%
>   hugetlb      1G   53.6 (53.0-53.7)      6.5 (4.2-6.6)     -88%
>   hugetlb      4G      211 (211-212)   23.6 (17.6-25.2)     -89%
>   hugetlb      8G      423 (422-424)   45.8 (45.8-47.2)     -89%
>   shmem THP    1G   52.8 (52.5-53.1)      6.3 (5.8-6.8)     -88%
>   shmem THP    4G      210 (207-214)   20.7 (19.5-21.1)     -90%
>   shmem 4K     1G   52.0 (51.6-52.7)   51.8 (51.5-52.9)       0%
>   shmem 4K     4G      209 (209-211)      208 (208-209)       0%
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

This commit message should explicitly say this patch depends on
Lorenzo's series in addition to mentioning it in the cover letter (for
merging / backporting). The mm/core hashes may change, so just by the
series title or patch subjects for now.

> ---
>  drivers/dma-buf/udmabuf.c | 85 +++++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 81 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 018937435356e..9f53d33fbdd9a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -44,12 +44,63 @@ struct udmabuf {
>         struct miscdevice *device;
>  };
>
> +/*
> + * Return whether the PMD-sized range of @vma at @addr is backed by one =
aligned
> + * run of contiguous PFNs, which can then be mapped with a single PMD.
> + */
> +static bool udmabuf_pmd_mappable(struct vm_area_struct *vma, unsigned lo=
ng addr,
> +                                unsigned long *pfn)
> +{
> +       struct udmabuf *ubuf =3D vma->vm_private_data;
> +       const pgoff_t nr =3D PMD_SIZE >> PAGE_SHIFT;
> +       unsigned long first;
> +       pgoff_t pgoff, i;
> +
> +       if (!IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP))
> +               return false;
> +
> +       if (!IS_ALIGNED(addr, PMD_SIZE) || addr < vma->vm_start ||
> +           vma->vm_end - addr < PMD_SIZE)
> +               return false;
> +
> +       pgoff =3D vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +       if (pgoff >=3D ubuf->pagecount || ubuf->pagecount - pgoff < nr)
> +               return false;
> +
> +       first =3D page_to_pfn(ubuf->pages[pgoff]);
> +       if (!IS_ALIGNED(first, nr))
> +               return false;
> +
> +       for (i =3D 1; i < nr; i++) {
> +               if (page_to_pfn(ubuf->pages[pgoff + i]) !=3D first + i)
> +                       return false;
> +       }
> +
> +       *pfn =3D first;
> +       return true;
> +}
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +static vm_fault_t udmabuf_vm_huge_fault(struct vm_fault *vmf,
> +                                       unsigned int order)
> +{
> +       unsigned long pfn;
> +
> +       if (order !=3D PMD_ORDER ||
> +           !udmabuf_pmd_mappable(vmf->vma, vmf->address & PMD_MASK, &pfn=
))
> +               return VM_FAULT_FALLBACK;
> +
> +       return vmf_insert_pfn_pmd(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE=
);
> +}
> +#endif
> +
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct udmabuf *ubuf =3D vma->vm_private_data;
>         pgoff_t pgoff =3D vmf->pgoff;
> -       unsigned long addr, pfn;
> +       unsigned long addr, end, pfn;
> +       bool pmd_ok;
>         vm_fault_t ret;
>
>         if (pgoff >=3D ubuf->pagecount)
> @@ -61,14 +112,37 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *=
vmf)
>         if (ret & VM_FAULT_ERROR)
>                 return ret;
>
> -       /* pre fault */
> -       pgoff =3D vma->vm_pgoff;
> +       /*
> +        * Pre-fault the rest of the VMA, except for the ranges that
> +        * udmabuf_vm_huge_fault() maps with a PMD once they are accessed=
.
> +        */
> +       pmd_ok =3D thp_vma_allowable_order(vma, vma->vm_flags, TVA_PAGEFA=
ULT,
> +                                        PMD_ORDER);
>         addr =3D vma->vm_start;
> +       end =3D vma->vm_end;
>
> -       for (; addr < vma->vm_end; pgoff++, addr +=3D PAGE_SIZE) {
> +       /*
> +        * Ranges mapped with a PMD before THP was disabled for the VMA k=
eep
> +        * their PMD, so pre-fault only the PMD-sized range of the fault.
> +        */
> +       if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && !pmd_ok) {
> +               addr =3D max(addr, vmf->address & PMD_MASK);
> +               end =3D min(end, (vmf->address & PMD_MASK) + PMD_SIZE);
> +       }

This fixes the v1 problem, but it means that a task with THP disabled
takes a fault per PMD size instead of the whole VMA. Including buffers
that are entirely backed by 4k pages. That partially undoes the
f0bbcc258e81 ("udmabuf: pre-fault when first page fault") behavior.
That's probably fine (would be good to see results for shmem 4K under
PR_SET_THP_DISABLE), but I think the commit message should mention
this also applies to 4k buffers.

Also probably worth mentioning / commenting that
/sys/kernel/mm/transparent_hugepage/enabled =3D never (we use that)
doesn't get you here because the THP tuneables are bypassed for
VM_PFNMAP VMAs with huge_fault().

If we stick with this behavior when THP is disabled, can we just do it
unconditionally (using pmd_addr_end(vmf->address, vma->vm_end))? That
would eliminate pmd_ok, the thp_vma_allowable_order() call, the skip
branch below, and keep udmabuf_vm_fault() within the faulting PMD's
page table and avoid repeated full-VMA scans (e.g. post
MADV_DONTNEED), which seems like it might be worth the extra faults.
Worth checking the shmem 4k numbers to see if the extra per-PMD faults
are negligible though.

> +       pgoff =3D vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +
> +       for (; addr < end; pgoff++, addr +=3D PAGE_SIZE) {
>                 if (addr =3D=3D vmf->address)
>                         continue;
>
> +               if (pmd_ok && IS_ALIGNED(addr, PMD_SIZE) &&
> +                   (vmf->address & PMD_MASK) !=3D addr &&
> +                   udmabuf_pmd_mappable(vma, addr, &pfn)) {
> +                       pgoff +=3D (PMD_SIZE >> PAGE_SHIFT) - 1;
> +                       addr +=3D PMD_SIZE - PAGE_SIZE;
> +                       continue;
> +               }
> +
>                 if (WARN_ON(pgoff >=3D ubuf->pagecount))
>                         break;
>
> @@ -89,6 +163,9 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vm=
f)
>
>  static const struct vm_operations_struct udmabuf_vm_ops =3D {
>         .fault =3D udmabuf_vm_fault,
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +       .huge_fault =3D udmabuf_vm_huge_fault,
> +#endif
>  };
>
>  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>
> --
> 2.43.0
>
