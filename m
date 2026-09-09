Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C876F284693
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967819; cv=none; b=rpBqc4rUZJqiRft8wxlP5wyVIzRs4C/1iO7q3sgLFdbGezKNjEpdmvOIpakPOm069tLH8ofCVq2zKcT3g3kh5lB/mMWBOpu8/Tp610e7pJSdMWvuIzWnZYbZSAQUFLhpczm4giVxmVqkICAw+hXkyJLuu45UifNGun6zf4YhP+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967819; c=relaxed/simple;
	bh=pVCzGj8l2w0RaDGtSqLj9QIPDIOMgpoppirHtWmxKoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqL99JKuiRY4LJj9Jox35lNOQs6Q6KhVORZYaPeh5VW8FJJY3SL+FXJq2IGskH20kYimzJEipQrscTVhfn4QCZq55kzxH8A4pHUGek5FMMhwTWgCdBxJosqK4iavPuesNF+XEr3BpcwXy48PI9B7IOHdG94E8NxcB08as0cQiMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLAO8NzV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLAO8NzV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850831F00A3E
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788967818;
	bh=QwEhflKuiwhqPTc4EAiTXST2I5cyiy7e2KYuuIw9i54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WLAO8NzVLeKO5MsmMmZUYrfQfbpFD5QFhoQntRocWLuvHbFq7RGyUIf2Aav+VRFD5
	 q1E7a+g2loQOBT9smJyMdp7VuU8eDukFpaIjCh7Kkj5s67z/tbI+RD3BiOY3wy4ry7
	 SRZ1WIwg7XQ8dQ7zK4rn/r9a/rPeSl/2FtE6N29Ty56EWCSU3aSDINEPXlTVD3jC6H
	 k/Cw5sEbD3ZIW5+D9kb1thFROCyhhH7ZxdAG2/Bot2pk+PgEuVued2D44DoRJmQcE8
	 cgEEv0ADCXeDz7CMkhCm7TQLQiddPez/KGfBNRfxIanAoHfnnhm1r5shz07GFSeL5y
	 TWa5n4Sg3zMIA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b568dae0e8so4568297e87.0
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 08:30:18 -0700 (PDT)
X-Gm-Message-State: AFuF++mTGJewMmxbhngv3MO31MeUj1ms6WjsuF0lu7S6PRaf09nUYtUv
	Sbs3plZDhwoHyS8qGIwANeV5KKISV50KyzGREbTUvkW3z8vZM07k9RbeyCw43qPJgNuupD5t9by
	mlZSKv/LqUmupTGQbAe+ahb+NdrfhHDs=
X-Received: by 2002:a05:6512:224b:b0:5b6:1a7c:fd8a with SMTP id
 2adb3069b0e04-5b61a7cfe7dmr5894765e87.48.1788967816879; Wed, 09 Sep 2026
 08:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828084328.257703-1-sakari.ailus@linux.intel.com>
 <20260828084328.257703-3-sakari.ailus@linux.intel.com> <CAJZ5v0jwmpqO+QhKjgc2ipU6GMFPt-+Uggi4U4oU2WH0_Yichg@mail.gmail.com>
In-Reply-To: <CAJZ5v0jwmpqO+QhKjgc2ipU6GMFPt-+Uggi4U4oU2WH0_Yichg@mail.gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 9 Sep 2026 17:29:06 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h703-PqVtch5Zr82FjRHWt0W1x7mo6PUHD-sB9LAnLuA@mail.gmail.com>
X-Gm-Features: AcwNN1WJhwtwtGgOzE5Y4vK99Y5IZdypCTKWLarGs_Ef-v9MWaZD1OKEwlPTRpQ
Message-ID: <CAJZ5v0h703-PqVtch5Zr82FjRHWt0W1x7mo6PUHD-sB9LAnLuA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ACPI: Use PTR_IF() for ACPI_PTR()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-acpi@vger.kernel.org, rafael@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:56=E2=80=AFAM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Aug 28, 2026 at 10:43=E2=80=AFAM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Make ACPI_PTR() use PTR_IF() so __maybe_unused can be dropped from what=
 is
> > being referred to.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

Or do you want me to pick it up?

> > ---
> >  include/linux/acpi.h | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> > index 10d6c6c11bdf..347763282f36 100644
> > --- a/include/linux/acpi.h
> > +++ b/include/linux/acpi.h
> > @@ -755,7 +755,6 @@ int acpi_device_modalias(struct device *, char *, i=
nt);
> >
> >  struct platform_device *acpi_create_platform_device(struct acpi_device=
 *,
> >                                                     const struct proper=
ty_entry *);
> > -#define ACPI_PTR(_ptr) (_ptr)
> >
> >  static inline void acpi_device_set_enumerated(struct acpi_device *adev=
)
> >  {
> > @@ -1073,8 +1072,6 @@ static inline int acpi_dma_configure_id(struct de=
vice *dev,
> >         return 0;
> >  }
> >
> > -#define ACPI_PTR(_ptr) (NULL)
> > -
> >  static inline void acpi_device_set_enumerated(struct acpi_device *adev=
)
> >  {
> >  }
> > @@ -1152,6 +1149,8 @@ static inline int acpi_mrrm_max_mem_region(void)
> >
> >  #endif /* !CONFIG_ACPI */
> >
> > +#define ACPI_PTR(_ptr) PTR_IF(IS_BUILTIN(CONFIG_ACPI), _ptr)
> > +
> >  #ifdef CONFIG_ACPI_HMAT
> >  int hmat_get_extended_linear_cache_size(struct resource *backing_res, =
int nid,
> >                                         resource_size_t *size);
> > --
