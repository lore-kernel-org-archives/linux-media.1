Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8414042D755
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784305861; cv=pass; b=PPEA6lnRFXHPbzWPezdy5HAJRtDFL7LGdAc02lFYeFQGwbVPY3flJg/SBi+UBlRWb+O5FJRl9ypc6/wt/khVsxJpV2FyNJOHwI7sfxiQ5tlWs4CxbMc2TRWQpvlntU9nBm0xBejJU948xQxT1zhplbMBrDKmIaVSIM+Y91JQZkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784305861; c=relaxed/simple;
	bh=x/TpikJydgPAR12gjRCW5tgQd0rdAPkfC74w1d+46DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkUpqJgRxfT1ClM/qpLYUTUe7RuRtPnXNpA7E2MlxePW/YyumnlX34+UbviWTwqxYEA4n4R7GDjogKrxGldx/6I+VIQYImriCW2YW3w3Hrq9aOKOJlo0iWaIZpLv3t1H5fdYvJfB6QIjsKATZVI6MNfxz1D0Mih4G2LIvKnQzqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iQ5c9IGv; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iQ5c9IGv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceb096e675so75618675ad.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 09:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784305855; cv=none;
        d=google.com; s=arc-20260327;
        b=Dcbkzmw3J+uHn8mqE9JgBMX56ANR05XU4s2+88T9nOE+1qOiFZDqee6N+u4lbLEUQj
         RTnyNUuvCJe1kxHdKyUaEsSfVTHWLUUB5X9SoSwGG85es0+PkdybmCj4wHKiCWlgrXMO
         tGb86M5Wli6OaTPzVTjRU/L/QIWjqbcbvHqHC/EuQDi4VJlaKENrWsmSAx1DjQNsi2wV
         wViCGl6Efyk9jpob58NMf1YZ08k4i8bot3g6nRGV8dgjLZzBa48j14Uh7CYeO6DXY6tx
         jySU2mUjbOmGfDO6W3GW7QC5+5M7N+1RVPOsEUuqnuVEJCsUgxD8svEcIcnZTTazvS1b
         9gtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mEFacLIneOp/QmtLUJi4Z80V3TBrQh57oZzZOS5MMp4=;
        fh=xlmSJ2d9XYOS3dznUWHJglE3iJ4egakAsA3lmcOFzgM=;
        b=lawd56L+6Ch17gkLKzymUO+jZpN0U3KQ0wlVu8cQlnk94INOu4Nb1qPMZcuvLmRieg
         UIPjLP5h7lZwTKc5O7zgiS8p9P33BkPLb655/LqK8cgUfMIuT9e5WFal7d+nQtdLEj2h
         B7Sp3EsNZs0Il5y4WAo2WWuJTKlnyohc10L6l6U+D7xIoECusf3UNqxm/g9+UMnfhtqy
         BU+nj3yFeZvN1YVqlsxxQ6sYM0mcWsIfk9orNir+4EfbiTAxrGPMDVkppptrahFOozFi
         JZ537zzW2vjWIlnSn8eu7NoSwP2TpjRZdRjXyqXtDKQS2I3qRS5FATiVTeJ7w9hw7k3Z
         RfqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784305855; x=1784910655; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEFacLIneOp/QmtLUJi4Z80V3TBrQh57oZzZOS5MMp4=;
        b=iQ5c9IGvFLkz0xaRw5nAwEGKUVzfx1qtxWW1wL4ki/D31ldKaTVYfS/REUdnOClFAp
         bFSGlPRnARwsbo7ySwsFZkdP/l3xCwxILPqKik+Hs1JG5NhxTr7mYRqRJelDhBdSYxzz
         H3gNmymPfHecpyeYAuGmTaDJN1NtqTxPJ1HIFFAR6KHCW5aMS8aC5Ro67pnFbiQEkafl
         h55M6+/6V38K0W13XSqSlBi5118CJiV/Y1dj45sGAUjiqU2MkroSUulLnubCyO2cXmhY
         ipNnwM4ovPP1xIwxpyODFIbd9Bpcbe2qxJM6wpgXGFzkeICs5Yu8RUQrbnyaNnNtJFP3
         chHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784305855; x=1784910655;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEFacLIneOp/QmtLUJi4Z80V3TBrQh57oZzZOS5MMp4=;
        b=VWbgpcJsHd8p4JPgy+TKXkXOPbjQqSObz0lqd70KgKt6yVDEsrwGEz+W8+L5HwYQwW
         XUfNVnDcd9Lme1Hik/gTzwqsgGM1b7H9FYs9lzBhCoTh1edAlJRmIjZd1lYLOFIUAe3S
         W+XtLwwrzm1kaVHrsLcKF0OqyLZ1oLJM2LmkO8MvAxomkrL67P3QWGK1bip7mepO85Zr
         dCTx4y0fNwvIrpdIxcJq8hSUwsPMhRa5Fj8dJoegir0hA3vxIlg0wug+6may4exfnDJI
         RkyMkEudC7eHQSQv2hiVO/UTHe2fzgg3tqDR3/4LVIRNXXcnDEY3tci+D3UDkKETWoIj
         /SCA==
X-Forwarded-Encrypted: i=1; AHgh+RpaMLEVpVNePHYGFeskqwB2+xwYYCDfrNaexrSzieY7+WCOjc4NMFNFsH0HPWZ4gPYltVqWXlv+6+goiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UgxRAs1mNEFZSFzjiZ5kTbWhSyJaSLv0me/j92VcaC3VlX1b
	s7A73t0vVgvTHHNYJ+LgH+3UA9bsYi9j9SCsZBo8bK70ugLv5es6PE4r3aVVlnios36TZilJQZ1
	dD+x6eHDvEQvQITRcvkZQAu+DuCd89DYSG3+d8rw4
X-Gm-Gg: AfdE7cn69nGBzizCBcSqE8he0bnGVvIirm2ylTnwW2XNoEpmjh9Zw2nK4CZ+4XO5TBN
	E2zREWXpxBHnfD0+S3wzvHfg0h/TK9sHWImoRzo7HXMZO+8SWdpF/KtZrJrWjZvnpT/SYRXyDd1
	xxGcpA/Ax+CobFBVyGc/v3jfyMYbdU8q3lfXyFYXQVNWLOV4yvghXBQb2DB5EUy8NwSAaxVPD1b
	yG8w4n/ZzVBzpmoeCBKBs+Z+STUSrxb81H5tOZnRGiP5LJpgSTLL4AIoFLqxg==
X-Received: by 2002:a17:903:19cc:b0:2cc:db71:4db5 with SMTP id
 d9443c01a7336-2cf349d3ee3mr39097735ad.37.1784305853798; Fri, 17 Jul 2026
 09:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715174737.15287-1-matt@ozlabs.org> <CALzav=fH7N+ionUnELqw5ZaGrPmgp_w6kxoCtoY8fMmZY_S4zw@mail.gmail.com>
 <65ba06e7-4c54-437d-9fbd-632c0468f66d@ozlabs.org> <allLypOmtbnPrgbw@google.com>
 <20260717094230.21829508@pumpkin>
In-Reply-To: <20260717094230.21829508@pumpkin>
From: David Matlack <dmatlack@google.com>
Date: Fri, 17 Jul 2026 09:30:25 -0700
X-Gm-Features: AUfX_mwhrL8yyMXeQp2wwPQntVuYsbostLm0_QgQevpUJ-QTbHpefGc5UhWYaLU
Message-ID: <CALzav=fx2i1ONLjBTheHpdOQqQJJ05OP9b4-D3HkK6NumKi=pg@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] vfio/pci: Add mmap() for DMABUFs
To: David Laight <david.laight.linux@gmail.com>
Cc: Matt Evans <matt@ozlabs.org>, Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>, 
	Kevin Tian <kevin.tian@intel.com>, Pranjal Shrivastava <praan@google.com>, 
	Longfang Liu <liulongfang@huawei.com>, Mahmoud Adam <mngyadam@amazon.de>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	kvm@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 1:42=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 16 Jul 2026 21:23:22 +0000
> David Matlack <dmatlack@google.com> wrote:
>
> > On 2026-07-16 03:51 PM, Matt Evans wrote:
> > > Hi David,
> > >
> > > On 15/07/2026 19:12, David Matlack wrote:
> > > > On Wed, Jul 15, 2026 at 10:47=E2=80=AFAM Matt Evans <matt@ozlabs.or=
g> wrote:
> > > >
> > > >> This is based on v7.2-rc3.
> > > >>
> > > >> These commits are on GitHub for easier browsing, along with
> > > >> "[RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test"=
:
> > > >>
> > > >> https://github.com/metamev/linux/compare/v7.2-rc3...dev/mev/vfio-d=
mabuf-mmap-v5
> > > >
> > > > It'd be great to have this test upstream. I'm happy to review it wh=
en
> > > > you're ready. Looks like it just needs to be redone to use the VFIO
> > > > selftests library and kselftests harness. AI could probably do the
> > > > conversion pretty quick :)
> > >
> > > For sure, I'd intended to catch up with you on best approach here. :)
> > >
> > > Aside from the organic structure of the test (the open-coded VFIO
> > > device/group setup/init needs to go), the main issue is that it relie=
s
> > > on a hacked/out of tree QEMU "EDU++" device with a second larger BAR
> > > (containing freely read-writable memory).  A subset of tests run with
> > > the in-tree EDU device, but coverage is too low.
> > >
> > > The desirable properties are:
> > >
> > >  - Having a BAR that is pure memory (all locations present, writable
> > > without disruptive side-effects) so that mapping aliases can be
> > > constructed and detected.  This is good to test things like non-zero
> > > vm_pgoffs and VA space presentation of physically-discontiguous DMABU=
Fs.
> > >
> > >  - BAR >> hugepage size so we can eyeball huge mappings work (or bett=
er,
> > >  mechanically test for them).  At least 32MB would tick this box for =
4K,
> > > 16K page systems.
> > >
> > >  - Something QEMU supports*, so one can run the test in a VM/TCG syst=
em.
> > >
> > > There were some real device models in QEMU that could be used this wa=
y,
> > > but needed a fair bit of setup;  I didn't want to rathole
> > > vfio_dmabuf_mmap_test on including a ton of device-specific code for
> > > some video card or similar.
> > >
> > > I'll dig more for a simple target that provides these properties --
> > > obviously it would be better to point this test at an off-the-shelf
> > > device (including silicon!).  And, proposing EDU extensions to the QE=
MU
> > > folks may be useful (there're uses for a better EDU in other contexts=
 too).
> > >
> > > Since this test uses MMIO for a specific [class of] function, my firs=
t
> > > thought is it should be another VFIO driver-type test sibling of
> > > vfio_pci_driver_test.  For example, we could extend the driver-type
> > > tests' backend struct vfio_pci_driver_ops for functions capable of
> > > providing a Big Memory BAR, like QEMU EDU++.  EDU can also memcpy, so
> > > could also support vfio_pci_driver_test.
> > >
> > > The spirit of the device backends hiding setup of a complex device is
> > > handy, and it's plausible that several backends could provide this "b=
ig
> > > memory BAR" service.  What do you think, any concerns with extending
> > > vfio_pci_driver_ops like that?
> >
> > I wouldn't recommend leveraging the driver framework unless absolutely
> > necessary. It makes the test harder to run.
> >
> > The biggest issue I see with the proposed properties is being able to
> > treat the BAR as memory. That obviously will depend on the device and
> > may require device-specific setup. If we decide that treating the BAR a=
s
> > memory is truly required then using the driver framework is the way to
> > go. But I'm hoping we can avoid that requirement.
>
> Could you run a test where only a known part of the BAR can be treated
> as memory?
> A large BAR is likely to have some areas that can be accessed as memory.

Yeah. But then the test can only run against devices the test knows
about. So we have to update the test every time someone needs to use a
new device.

We could support a command line option to specify the BAR subregion.
But then the user has to figure out what to pass there.

So if we can find a way to get equivalent test coverage with "any
device with a large enough BAR", that would be ideal. Then it's just
matter of the user picking a device, and it's easy enough to look at
BAR sizes via lspci.

> >
> > Instead, I think you can get pretty far by inspecting /proc/pid/pagemap
> > to determine if the mmap() set things up correctly, without actually
> > accessing the BAR. You can use /proc/pid/pagemap to look up the PFN and
> > PAGEMAP_SCAN to detect huge pages.
> >
> > With that requirement gone, then all you really need is a device with a
> > large enough BAR. And even that it not a hard requirement. I'm sure
> > there are plenty of test cases that could work with smaller BARs. The
> > few tests that want to exercise huge mappings can inspect the device BA=
R
> > sizes first, and if they're all too small, SKIP() the test.
> >
> > If you structure the test this way, then it's easy for the test to be
> > used. It can be run against any device for the basic functional
> > coverage, and can be run against a device with a larger BAR for full
> > coverage of huge mappings.
> >
> > Does QEMU emulate any devices that have 32MB or larger BARs?
> >
>
