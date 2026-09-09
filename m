Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B7233438F
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 15:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968738; cv=none; b=QCut5NQeqJTKypYps3bO8PUQfwg7FqoQaZ2OlHoybIeb4wzKp0I0+oHMKQ2rFPY8pnulwrbhOru7wSC0DuQ1u0CYLYVmjms2hqHwwozXp6+2EyNbQCJiB106Zwkj0g9ofuOhJ7ayqltVJv55Zr//WVio2BFD5DLRSFkMoOAKNKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968738; c=relaxed/simple;
	bh=S7i6bbUdzsNUr/+qyqkCAZaXm22YnhVchIbUmU1ekcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCk2k2UnnZalLswsMldjCVfZrcoU1tX/RDnEAIFnYpLtkmTF6khUgzzy9jErzLm+tZlSEKp3VbGUAS2nhrirQGrLnCNpwk2dJ1zmsjbe7UxOZZj8N5Md8H/UIlZ656DNQqjJdx51jxpEKPeJ2o8hNIfbBnIQObexCYJECsgsSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+TOqP/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+TOqP/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC111F00A3E
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 15:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788968737;
	bh=S7i6bbUdzsNUr/+qyqkCAZaXm22YnhVchIbUmU1ekcc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=k+TOqP/WOpE0aL3RS7wkmf7zpsggAgqpIlVNcxDEkRNoFdWqZaJj3BwiQp9JE5UEN
	 C3cky/iiF1LT+D8hjzKI1J1EhdlQH2z+VsEwsIzWVANmDz287o/tHt7XEebwUiwyPm
	 0EvA4j/f9Q9BYt1kpgyzn3eNcVaeBNlAUDhxxymcXB210TGwW5QY8WuciX9s9Mhw9f
	 b8CBMQic7grCC5f4/iO7bI3MxckGNHzLVs+TKUkDR8k141kqe2HAAs33G4DiKr74fa
	 U72yl0VtBQ5kqh2VESWVtCPp6EofP5zkik5pTnWy2VhFuYjA+6UMijC4TDiAq89K/r
	 ahIpubQentSdw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c95395230so52641891fa.2
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 08:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByyO3L5u82YkG4/TPeka1DfOpvCsCt5SosTJD3f4YImki/hhhC3zKK8j7itkCXszyLGXh0n5txgDKDI4Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mi0cDudgdWYjr+p8sgPS2FIPTvcnnYav/NY6pHXJQif50xfljZ
	NhzGg329bv5xOgQvWL4HjzOiwuVUk/yWln09Ewc5eI3Y+CdZ1WxWpvGAk0knj1o1eBWdFCjXLpi
	uRBZvjpwcw2RT4KYgBK49BNmUx/td16M=
X-Received: by 2002:a2e:bea5:0:b0:3a3:7682:499a with SMTP id
 38308e7fff4ca-3a376824d0dmr35597111fa.15.1788968735668; Wed, 09 Sep 2026
 08:45:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828084328.257703-1-sakari.ailus@linux.intel.com>
 <20260828084328.257703-3-sakari.ailus@linux.intel.com> <CAJZ5v0jwmpqO+QhKjgc2ipU6GMFPt-+Uggi4U4oU2WH0_Yichg@mail.gmail.com>
 <CAJZ5v0h703-PqVtch5Zr82FjRHWt0W1x7mo6PUHD-sB9LAnLuA@mail.gmail.com> <aqF83WCG6TnZuwsq@kekkonen.localdomain>
In-Reply-To: <aqF83WCG6TnZuwsq@kekkonen.localdomain>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 9 Sep 2026 17:44:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gxaWmFJtE7o8+YApAfwxeQtCac+DSMyRZ1A9o5Xqy8sQ@mail.gmail.com>
X-Gm-Features: AcwNN1X8TKY_vWWmHp5Z5bzeBOHapUPmEEUiPrWLkzX53pE9rLA3LxWrYRoMTmk
Message-ID: <CAJZ5v0gxaWmFJtE7o8+YApAfwxeQtCac+DSMyRZ1A9o5Xqy8sQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ACPI: Use PTR_IF() for ACPI_PTR()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, linux-media@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 5:35=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Wed, Sep 09, 2026 at 05:29:06PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > On Fri, Aug 28, 2026 at 11:56=E2=80=AFAM Rafael J. Wysocki (Intel)
> > <rafael@kernel.org> wrote:
> > >
> > > On Fri, Aug 28, 2026 at 10:43=E2=80=AFAM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Make ACPI_PTR() use PTR_IF() so __maybe_unused can be dropped from =
what is
> > > > being referred to.
> > > >
> > > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> >
> > Or do you want me to pick it up?
>
> I'm happy to take it.

OK (less work)

> I wondered if you had an opinion on ACPI_PTR() use in the third patch.

Not really TBH, sorry.
