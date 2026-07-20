Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1A43CB2CF
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584271; cv=pass; b=srU5i5mXWxMDgOyODRzLNaYk3iivfrQhLx1PbUvl/ZZeWLRNU0Vp0Gb8lNmGlQeQbvkSP5EzELHbs68A7TjQYoUpdGj5aZmrWQ9t+9NzgugqBCBZshH+CnKMHg+hkW+3cu2guKlJCLqq0bjO1KS5fmNvt+pE3NDzbMpDCOAItII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584271; c=relaxed/simple;
	bh=FWetYHTKU3plFs91yFZPvyCfOh01CzXliAvG6YxxB2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oa5ydVKSC0iuQ/xDrO1t0MwpXYoW7Yt/WH0+cLqxLrGwhiQSvbYJbyJb+AaEftUszXoZR5CwJk69pX/nmH5dYNP9+9aP8+Vr+hiEM4BE0vpviWahJ/FwXrNkXrwjwnh7o1L7bgYQvPgGgiSS9Vc0rlVUsaWo5Am9BxO2CP+ip+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WjawJNAd; arc=pass smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WjawJNAd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84a652535dcso3612045b3a.3
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 14:51:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584269; cv=none;
        d=google.com; s=arc-20260327;
        b=hGU53gVzCOQzxXOoGvnBGiK6g/3MOIA4/Q6Trfc7gGqVqAYpwzj1dBsFuN5+wkPztw
         wbuLltGehe8rZDxw9MaRwwNT50LDItPL0G/P0D1yVHMen1+KLpkDGihi2DBJ6YF2FGht
         B3jCPL87+94s6HnPtqqO1UGqzkrdrx1s28Q3CeXM9SvpL1g2bYsgqd9OUyLtKpFWU630
         EIrtYfjCmmVnn62YwljfYnJF8SFRaoSl7lUnfH571wS5aHcxzCzAfhqjowa6QE1F0w7B
         hieUBRmhKMUUYr3x0UK3Z5EPZ9JQiyE6/NlgvjTZ3jVPzpqm1pDja1N78pMAI5vvTr+s
         pMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bdKI9817I2WeOtdz9Fsw1SXm2Wjzy1v2qUyVdVHNzDU=;
        fh=l2QplLXQCLzNG++6CKiGYn9T5/vp+mglgE39EQ/w3Wk=;
        b=fPkHQX8gRDwh0XEoT7Zi/HcxgpJ/9PG5IhBsh/D/o3lFPkJDMtkrUcxnj3pFbpP9iz
         zsGsHRSmExvbgL2XmJQdjT8u2Zo+Lfi731gW9YbzgO3UyWHhWagkuRs3WcQ1cwKBdHa0
         IN16/TTiPExF6vjr6vVuy7cjh1ueTZWNbaTGVv5bGpZWQ3ah1csvjZMC3O+mj/wmksj6
         Q4L6r/OJsyZveLU9jSSRoSa+ZlqqtWYrzbzX3khFRJV52NKdu8E2mypWXt85ic3n/aSG
         WfU03HUce8AmMy5Z1xUpv/kUiu6KMqaKTBSjMpZ+52bpn6oxY5Er3AWCeq4kOsROuGzd
         bbzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784584269; x=1785189069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bdKI9817I2WeOtdz9Fsw1SXm2Wjzy1v2qUyVdVHNzDU=;
        b=WjawJNAdqcugnTKwxXUZ4ACIjQmP9/n0gIYP2U5eYHlWacJ6VaKb0aUxFhK/tGVaDQ
         Y+H78c8sMN++nrKOAHjLUhrtUFaFmZEZ0MGuTI+oL2/Dsq7d3SFT77wWuXgc2rU2vrLL
         ah05hnV9JF8EK8nSkI7ouqCVV1n1JbKWrsVh/U77bg0D+Px8row5+Oxd03HwB3XzHRkD
         73FmukO26nC/8PiSMALnHzkWMRANUK1tZnalvla6czJSQPbbdftaIx+8jFwsxNt1vwtJ
         mqGAFTykrGCDrPEwepdi6lE86WsLtmF6ygxQrG0f743qTlr+GyVbEu3YJ9/lKO4jpAP/
         mhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584269; x=1785189069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bdKI9817I2WeOtdz9Fsw1SXm2Wjzy1v2qUyVdVHNzDU=;
        b=Xj/+scnU2ZBFq+ECbnw2gKEK5ho7S/rC7MOEABj/frqRgxLf/1pKiRQsSC3jKIbw+h
         GZ/OnnwVuTNPK1WLPHseOgLG30qkW3kuFJHfTIUxOGS/ItVCeUN5TPbDJQupks2QqNGV
         f5KxkHQpxkeUXnY7FgvwaOGDErDQpMlsDedK67ThPvOZ6Bo1fJ/w/bQXEXErsHcw8jvk
         cDXanGHYcZYlGFCGXRQ1R3M0hkGON9jqgPzObaJRJi1qfZLcPmFpMthp1+1rjdYMRhwM
         VJnXtOrS/lYNYezm7CuD7hj/VkUA2alVXHVAybJPPxZ2o1+wZLpxZQ4/ot6ODhMrNEq/
         WhGQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhTrxaFUfjDAiu6/ojgH62DKAvldcSNVCqIV0M/FuW9cdTfsHWSMQnHyxfpEEuIlqnnlrB6Fz3RKKpLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyhfORqtyc7GTdcXsPECKDGt9yOMgNEGxHc7ZzM1vcO/s/lI7o
	aNt6SIPC1yMHnk0hqP/OzBVnd4/s0Gv7fJqgMiTFRpH1sKN9uy//oyrJ4A/TCHl0S0PQl5njA4l
	AX6HSgDHi7NVfeDqSfKNI8uBEnnFoYBdx1WoXOpLF
X-Gm-Gg: AfdE7cljXEgWVlQUtKgVn1xtu1APxJFbKsJIgQA/1I8izjw5/VYZel5XRtr7OaWq6bU
	2urvZ/d/8HwpNpdqi8dA3yNetm1OMON9tTEFQoVvI5dRu0tMr5nTAVC1EfxHkIiQc+79pX6xeIZ
	evxKOIIchVFhPJuriZHj9x6YuUnH7f7niYV3+ZKbC5bV1Mh34OIKPyF3Mn91S0Q2MSUXb7poFGe
	bcs2UthGpL77qukRad4jAaCiaBRLV8cY8uwv0pIwkNJXgyfibeILsvH9zR/iAovC4+c7RIXjSnf
	iOlIBjM=
X-Received: by 2002:a05:6a21:b94:b0:3bc:5284:5445 with SMTP id
 adf61e73a8af0-3c3ad7d7fc8mr17622851637.21.1784584268526; Mon, 20 Jul 2026
 14:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715174737.15287-1-matt@ozlabs.org> <CALzav=fH7N+ionUnELqw5ZaGrPmgp_w6kxoCtoY8fMmZY_S4zw@mail.gmail.com>
 <65ba06e7-4c54-437d-9fbd-632c0468f66d@ozlabs.org> <allLypOmtbnPrgbw@google.com>
 <cc59a80f-afcc-4b2d-8e78-20f74c6b6871@ozlabs.org>
In-Reply-To: <cc59a80f-afcc-4b2d-8e78-20f74c6b6871@ozlabs.org>
From: David Matlack <dmatlack@google.com>
Date: Mon, 20 Jul 2026 14:50:41 -0700
X-Gm-Features: AUfX_mwkLBrmrzOblowqnnWuP3v7QICLsI9pjWJDYOH2ogP4CV4E0O_pKuQFz1Y
Message-ID: <CALzav=cGtmkBBpfUA8nP7AQ3azB_Hn7_8jJL=J+E+h61CpOFrw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] vfio/pci: Add mmap() for DMABUFs
To: Matt Evans <matt@ozlabs.org>
Cc: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Alex Mastro <amastro@fb.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Fri, Jul 17, 2026 at 10:12=E2=80=AFAM Matt Evans <matt@ozlabs.org> wrote=
:
>
> Hi David,
>
> On 16/07/2026 22:23, David Matlack wrote:
> > On 2026-07-16 03:51 PM, Matt Evans wrote:
> >> Hi David,
> >>
> >> On 15/07/2026 19:12, David Matlack wrote:
> >>> On Wed, Jul 15, 2026 at 10:47=E2=80=AFAM Matt Evans <matt@ozlabs.org>=
 wrote:
> >>>
> >>>> This is based on v7.2-rc3.
> >>>>
> >>>> These commits are on GitHub for easier browsing, along with
> >>>> "[RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test":
> >>>>
> >>>> https://github.com/metamev/linux/compare/v7.2-rc3...dev/mev/vfio-dma=
buf-mmap-v5
> >>>
> >>> It'd be great to have this test upstream. I'm happy to review it when
> >>> you're ready. Looks like it just needs to be redone to use the VFIO
> >>> selftests library and kselftests harness. AI could probably do the
> >>> conversion pretty quick :)
> >>
> >> For sure, I'd intended to catch up with you on best approach here. :)
> >>
> >> Aside from the organic structure of the test (the open-coded VFIO
> >> device/group setup/init needs to go), the main issue is that it relies
> >> on a hacked/out of tree QEMU "EDU++" device with a second larger BAR
> >> (containing freely read-writable memory).  A subset of tests run with
> >> the in-tree EDU device, but coverage is too low.
> >>
> >> The desirable properties are:
> >>
> >>  - Having a BAR that is pure memory (all locations present, writable
> >> without disruptive side-effects) so that mapping aliases can be
> >> constructed and detected.  This is good to test things like non-zero
> >> vm_pgoffs and VA space presentation of physically-discontiguous DMABUF=
s.
> >>
> >>  - BAR >> hugepage size so we can eyeball huge mappings work (or bette=
r,
> >>  mechanically test for them).  At least 32MB would tick this box for 4=
K,
> >> 16K page systems.
> >>
> >>  - Something QEMU supports*, so one can run the test in a VM/TCG syste=
m.
> >>
> >> There were some real device models in QEMU that could be used this way=
,
> >> but needed a fair bit of setup;  I didn't want to rathole
> >> vfio_dmabuf_mmap_test on including a ton of device-specific code for
> >> some video card or similar.
> >>
> >> I'll dig more for a simple target that provides these properties --
> >> obviously it would be better to point this test at an off-the-shelf
> >> device (including silicon!).  And, proposing EDU extensions to the QEM=
U
> >> folks may be useful (there're uses for a better EDU in other contexts =
too).
> >>
> >> Since this test uses MMIO for a specific [class of] function, my first
> >> thought is it should be another VFIO driver-type test sibling of
> >> vfio_pci_driver_test.  For example, we could extend the driver-type
> >> tests' backend struct vfio_pci_driver_ops for functions capable of
> >> providing a Big Memory BAR, like QEMU EDU++.  EDU can also memcpy, so
> >> could also support vfio_pci_driver_test.
> >>
> >> The spirit of the device backends hiding setup of a complex device is
> >> handy, and it's plausible that several backends could provide this "bi=
g
> >> memory BAR" service.  What do you think, any concerns with extending
> >> vfio_pci_driver_ops like that?
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
> >
> > Instead, I think you can get pretty far by inspecting /proc/pid/pagemap
> > to determine if the mmap() set things up correctly, without actually
> > accessing the BAR. You can use /proc/pid/pagemap to look up the PFN and
> > PAGEMAP_SCAN to detect huge pages.
>
> Hmm, possible, although that's quite a different test at that point.  I
> agree never touching the device has advantages, but it's harder to test
> certain things if we _never_ do MMIO.  The mitigation effort to get
> coverage may not be the right tradeoff vs easier running.  I can think
> of some "easy" VFIO bugs that would be challenging to properly verify in
> userspace (e.g. PFNs all having some undesired offset).  The current
> test method is harder to fool per unit effort in writing it.
>
> Though, I will have a think about this no-touch flavour of test.
>
> What were you picturing regarding populating the VMA PTEs in order to
> inspect the result via /proc/pid/pagemap, whilst still upholding the
> principle of not touching the device?  For example,
> madvise(MADV_POPULATE_WRITE) won't work on the VFIO BAR regions because
> they're VM_PFNMAP/VM_IO.

You're right it looks like it's not possible to fault in the VMA
without reading or writing to the mapping. We could use reads, but I'm
not sure that's safe for all devices.

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
>
> Yep, looks like `-device pci-testdev,membar=3D64M,membar-backed=3Don` or
> even `-device bochs-display,vgamem=3D64M` would be suitable.
>
> So I'll also try moving the existing test over to one of these to at
> least remove the EDU++ device dependency.  (bochs-display has >1 BAR,
> and some MMIO regs which are nice for a quick kick-the-tyres access test.=
)

This seems like a good compromise.

I would suggest making the test as device-agnostic as possible so
other devices can be more easily added in the future. For example, add
a helper function to detect known "pure memory" BARs, so all
device-specific detection and setup logic can live there. We can put
that in the test .c file for now and move it to the library
if-and-when another test wants to use it. It probably makes sense to
merge this with the driver framework but I think I need to see more of
what's involved to really make a call.
