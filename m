Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B707F3C140F
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 18:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178439; cv=pass; b=PKH8RsoikR74kBTtMThbkbmG6pv/k12liaIIjtxtvOiUx9ikkVr5LcyUSwrDHvoAhheoUQY/R1a/UZQtsZ6MBQkwK8Q9lXplSjqFMOqVSFw/m+I3zYbGlRekgkGfwTtGXFZ/Lq9eZr0Ro6pGorwvDd1m178n7jOCvh0YfVynAH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178439; c=relaxed/simple;
	bh=jBGj3vq73TpQNUHtZ8hP8T9s3Rn/i9PzV5LYqBYc5Jk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N/OmDLyreEyUpjvxQ883sqoZbQl3mHm4kxZa6dbLG3tLOT7Lppuc7eHyJ5f1t2CuYf7g7adnwiBmlgH+kof2nSd9JdkXKLn7a19qXGmkrkJxEfdj3yDk/hW3v4piMxqRmnmygTVTwIg/PD3Tt6+C3kQZXvmMrxU4/EbAWx+I8wA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UJFxwML0; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UJFxwML0"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca957432c7fso2202463a12.1
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 11:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785178437; cv=none;
        d=google.com; s=arc-20260327;
        b=W9DNm23Hn5FABXQVMduAK1tAkUNV5+Lw9nExSu9cBYVcPrgCUXlsIVgGhXVgg5pGEh
         zViTyBfjUKjCiDkIqSfZwhZpmIZYI9An7S9xFgiHHJ4KGvmEQ7+lZ5O6we4iKD/Vvly8
         oKQMa56rsMWU39BnApdSN2O0i6e5LkQ07jbIfZD4xNfw3xt7U4E4UBdJaU5ddRqLr/k9
         17bWh2k3+F1gGy0Yvs79ZoQ5rQHQJb68eOC148J1gRSZwOtWVeAKb72dhnAqvH0OjlA1
         u039rnG6BHXbty4OYKiP/4DceV7qWKBJ8DRnoip+CMLc16d15dJFe/p9+c50h1nzLukm
         wSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=Ezc2drTNkvx/EGjvXJcxB1ItRYJScaQpIm5JRHoUsx4=;
        fh=x0wCzXu/IzPOxtiFQwvzJp6xItmUNhV8f2yjftAqsqc=;
        b=hEx65b2WCEkubACtqHnLo0v/gTN4vwXMK+WwATNbRPjT8vNDJxsmhE2JcQsHH0V7rQ
         kr4ma19HHmc0sERlFCcwPPPqbXQPy+SGXilf/13Bs7+YuTw9zzPE+WUiBEMsEQoHQYFb
         zZJOYim7y/8p0tWO0OkLgJ/1lKQNmvMs9pUzZ6KtIqsTtWbwDiR460j3Sw+juioF2xGM
         8xcSgF+N+N3WfIGVHUWEuDo5ic5WkGfw5qrpzsHCIXgPWg7D5DSO2qmkMpeygk7/6uha
         FGWDTJO56iRMuMS3TF8/VULKHerYPlM7sMyXcZ9RE/MVEiEDYDhWjEBYGTsiRk9ZWatS
         2PFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785178437; x=1785783237; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ezc2drTNkvx/EGjvXJcxB1ItRYJScaQpIm5JRHoUsx4=;
        b=UJFxwML01OyWDhhGzt5oP/vgee+QKm+snjmmmpDfkX2aopwCujH8dPQQ97ZHKh3mPo
         wSIyJgJm8M004RUsHokQRSTdo6NznNTwTkLQLxPtuxukI7+oeEQ1IAwr4QcBf/thLFNs
         QPn3NSWX2WGIX3Vh/6+MxlWfe+NPvmmR9Gu/mF6iRZwy6vKhYiQezuXx6LAcPikzD+AS
         5tstckADxD/CnHSEThTvm0xQoz7Yk9C//l/boH0tSu4gvLVQMJxSZuJHUllpT42ehOYD
         Lt6qqmz5ilUxbPtbFCIFH8dUHm0pytWZ+sHqFPF5Zvy9Mc7C2ow1sDgxaXWLYsnV5ApX
         SSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178437; x=1785783237;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ezc2drTNkvx/EGjvXJcxB1ItRYJScaQpIm5JRHoUsx4=;
        b=EFoVMa3iyCtf2D/vOdAjzY8kKwx/K0UqECDG9Ek7Zhlj2GOMM9DAtppHe2j3DgWiH/
         LXuHunSDOlPJgf4zFZq4S91serFBg6GyWSHGoR37SMZHcW6HbDw3CXtDmYSkvv5pwkHH
         1+ZU7zGZBhnSwYXTSr3HLI6drKkeVNK4SFSP1sY1CFbmtKxm+vzOFrrECYr1qcOZ3P10
         nORuoaqRK0LsVEJ2Yt7QmwSyYSd+l/2lJhUWdZd2IguOOvyVaSAHaZtnKGnQoOWK4d1J
         TLhNwTpWcb388DxcsTRv150V1FurWEXo0u+8o9b85ThJGIBF8VTMUS6Bl84lCz82w0gL
         VO/w==
X-Forwarded-Encrypted: i=1; AHgh+RosPEA/A6ANMKrTPUTRjVRDshEcxGusJV6RBB63beUkz2QqLbcQyHPyYpHyAumQwDMpd9i4dPEo401SjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/yuEyicuEw2tegornX5s5jKkAw11G0lr81WtzpS1i2vE+381
	RmzhtmCcGJnIsIQYDExUogZbEJJx0ujynKIS16JBTDestI29NvHUZ3QFR1ud9z+5KDjMbuI0hS9
	+putR0UgXnyeghyYFiO9b+UOCeKiDtX2UD4WUmvKb
X-Gm-Gg: AR+sD119og2fPRXdgu5GMmmBMxlVMel+j5J457uK1H+WE3LiAyCrHzuyb9zNYLLBGzl
	7px09iSf0UMvI1HqCISpN0zMykpbGFMU4UnsbQETXv1rH/cMbrBIEz3Aj+4K5kdXq5iYWGWyLOI
	v8Vv2QYyJ+30sAVLeOz7hUFyP6hoK/QMGdp7ooNGkjrpUX4DNdPZdbEqx9K/Xi4Yojg4eP1Xmqc
	a3+CQ8XKzXnnwkfNaVmihcQ8YMHydtsIbZT0gxSYsuzwZ2S/TlTdoU+kF9S+kw1fWTOYKE38izK
	PLhUQ51yDjwy/fRID+Cx5u9mXhquP99Ro3nMZxCBV7gLyxWX
X-Received: by 2002:a05:6a20:6a05:b0:3c3:7a0a:18a7 with SMTP id
 adf61e73a8af0-3c6c7fb20d4mr796670637.55.1785178436210; Mon, 27 Jul 2026
 11:53:56 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 11:53:55 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jul 2026 11:53:55 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <amcdueQI1voXWPQb@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-11-yilun.xu@linux.intel.com> <20250602133009.GC233377@nvidia.com>
 <CAEvNRgFpJWQ5M5sQhGpQUV3GbBq9N+MQhhaxdxa=D8ky94SCsw@mail.gmail.com>
 <20260712221934.GF674038@nvidia.com> <CAEvNRgEo2kLUmaGU-Vsgx2sTQvU_NNUJ4bRp5Z4Ygs_xvVLOYA@mail.gmail.com>
 <amcdueQI1voXWPQb@yilunxu-OptiPlex-7050>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 27 Jul 2026 11:53:55 -0700
X-Gm-Features: AUfX_mylYj_x8eQp0BvgfyW8gHfhB_jFskLbUbWzV0Fgf00qZT4Qn9h3hPlqeKo
Message-ID: <CAEvNRgGYc0B1YyhDhS0Khfm3N85hbkYGMTfDLiXYn+WHTLF2EQ@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] vfio/pci: Export vfio dma-buf specific info for importers
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kvm@vger.kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com, 
	alex.williamson@redhat.com, dan.j.williams@intel.com, aik@amd.com, 
	linux-coco@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	vivek.kasireddy@intel.com, yilun.xu@intel.com, linux-kernel@vger.kernel.org, 
	lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, 
	leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, 
	tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com, 
	simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com, 
	aneesh.kumar@kernel.org, iommu@lists.linux.dev, kevin.tian@intel.com
Content-Type: text/plain; charset="UTF-8"

Xu Yilun <yilun.xu@linux.intel.com> writes:

>> > If VFIO can create one
>
> It is an interesting idea to let VFIO create a guest_memfd instance, if
> DMABUF doesn't work. But to achieve this goal, I think we still need to
> refactor guest_memfd to allow for different memory/MMIO resource
> exporters/creators, and different resource importers/users like KVM MMU
> & IOMMUFD.
>

Yup I think both ways we'd need some level of integration from both
sides :)

>>
>> At guest_memfd creation time, guest_memfd is always created for a
>> KVM. This is the first place where it is bound to a kvm instance. This
>> is one place where it helps Yilun with Confidential VMs, so KVM can be
>> sure that the memory was meant for a specific CoCo kvm and not any VM.
>>
>> I think it might be weird to have VFIO take a kvm fd to create a
>> guest_memfd?
>
> I think having VFIO create a guest_memfd is better than having KVM
> create a guest_memfd on behalf of VFIO.
>
> The lifecycle of the MMIO resources should be managed by VFIO, cause
> the availability of these MMIO resouces are impacted by device
> operations, e.g., device reset, PCI Memory Space Enable (MSE) ...
> You can't export MMIO resources to KVM MMU without VFIO's awareness.
>

Thanks for explaining the above!

Do you mean that as long as VFIO knows that some addresses are not
usable, those addressses have to be removed from the stage 2 page tables
that KVM manages?

> And VFIO doesn't have to take a kvm fd paramter to create a guest_memfd,
> VFIO has got the kvm instance via KVM_DEV_VFIO_FILE_ADD.
>

I'm new to this - looks to me KVM_DEV_VFIO_FILE_ADD is for linking VFIO
to KVM but some mmap-ing is also required (pre-CoCo) to set up memslots?

With CoCo, setting up memslots would use some fd (guest_memfd wrapping
VFIO or the VFIO-created guest_memfd like you were suggesting) and I'd
think there will still be some notifiers between KVM and VFIO for the
mapping.

Btw is it right to say that KVM_DEV_VFIO_FILE_ADD is only in the case of
setting up irqchip? Is irqchip a requirement for Confidential IO?


Hope you also had a chance to look at [1] that David Woodhouse is
working on :)

[1] https://lore.kernel.org/all/1dc299af6b795a40c8887b3d84f915024f6446a9.camel@infradead.org/

>>
>> I was thinking that the userspace VMM could do something like:
>>
>>   int vfio_fd = open("/dev/vfio/devices/vfio0");
>>   int gmem_fd = ioctl(KVM_CREATE_GUEST_MEMFD, { .fd = vfio_fd });
