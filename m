Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862227;
	b=ngmDRV75WgP7pWgzB30rH3POxAjDr/8NCa77DQt4hkr59xrLJR9oQqBAyfuNOkyiO+Ap
	 USbX0yXZE/lNbn3yHsHHnPx9hGzyyA4vDsQVP0+l+Z0AWndd1YSNs+UUQ1LQEwy/500+y
	 LhhPNWGVrl8UQaCVat3uh+Rzt7ncGULr2Xk8EispGcdZdbZMXZ2pfWrLLt9RLuZd3z/dc
	 dncgIT+5zXi4O0UW8SkSslxro4cozpmZAEI357JRc74MD828bcwOG5I7xkVMHxorTngJu
	 RK5SREkvZa6ujPJ87Oi4w+cCDaTmY8xqszQJOsUzQqyR2muz5PYlhDOE1EYPrSK+q2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=itpoRBF/1k6lXJt+7gBQZf0XsZd0eRgpwFhim4ck9gw=;
	b=zSAUfEZtA6ZSfqb6OXWn6dMaGiVeGiq6HLJshShZ0G8+jR6EzYwUuoLqc1JAROHGddmv
	 dXhThgHgjOmTK3G1DuajKQfSAjkQUh3d+spAqqptpvHnm8vavLcPfwHPKm8hLy0u9iSJx
	 vCABGcBSVEZWokxKNl14xZEjhmkqoxRB4LhC+1D0zyjCfH/wD9XpVwHQ+ihSmfxJlXtqw
	 y2MjEwWP5zCPokwPSSSrVNhs1U5Kil0jflA0bhfMY9AJf9sUXKbFjT/qEfDl8o2oZXbKD
	 8DS3adLTLPK44qHc6VEYwa9Qs2flxjImb1NgGMZvlu4IitHp+DDiRP5LV3h66Mef0+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dwg3aB5j;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D34606A323
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 20:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D34606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dwg3aB5j
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1420420b3a.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794862226; x=1795467026; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=itpoRBF/1k6lXJt+7gBQZf0XsZd0eRgpwFhim4ck9gw=;
        b=Dwg3aB5j/PWPJaLku3L1tUZkBCUnHRSbqBmF3A4BQGz08Tq28ncBeYQbG/So5ZsN+h
         NojTXp3MVD/ZSvcPTtCd3tmxdm9+qM5KoPTSkI+CLdlA+txelMPpn8SZybXuEjrLBIaV
         YowodJucWxxle8t1RD08hQ061mcCTFHAAfcigRC9haQR8iCHdz2xN+lplQeaY4S1h8P2
         rfyRhY/H0SQx7FRPTAB/RKZgvSK1AUAlv4LwLdvUsGDJp95HEf/Kqijr56sClMPAuG4N
         jqnkIcUVMlGE6mtQ8PhlTITjVU0VqdOlyT+0EtqE4DK5p65P3wpVCNkS6l7wiGteLlYw
         f3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862226; x=1795467026;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itpoRBF/1k6lXJt+7gBQZf0XsZd0eRgpwFhim4ck9gw=;
        b=yqIH5IFPdHTOwPyAefQ0CAbnoEeCNiF4TCL3L1Zsft9+EgioPaGGm/L5uNA7ne223I
         uJIsl9jTtfIXUksAkl6tJVaZZytsVCRIOmKykS3+B+8SAZR+GSZyXfTj21TLJ+vTesNU
         DqcQPAhZ4phPON85mzTzhzxts9ffI496WFPRu92EcyK7iSNc1uVFtOSvbYjB4mzQ4pcr
         zL2KPQrsdmS4/wwiC4PGNvy9oYxGueGHEvfvWkgRL4PrUS9MYyqDjRxPzcLHcQbgTTYN
         pD3t2F4TA8cy6h51V31tJC2FFX/Yb/Vr/xcD1XeRe61JeMmZH5U7/dec0nMgwLc8OUsi
         gjVA==
X-Forwarded-Encrypted: i=1; AL+hErG6J7xwCf3051ZfI9VwIl25VvTFxjz/l2+kK7RYVxX8vsoZ48ylbFc7XXsAU9elcO3iyOFj2PFUro+p0w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9808Q2UVAN0RCi2ZBhBPNXJDmarEPFG7EA9QlJd3HZYkz1Kx/G
	Myf2+4wmMRV7WQT54uC+ua7um1N6A6ZBMol9UPT793hzl9ySZ6/NOdrYhu6yPuGnSQ==
X-Gm-Gg: AYBFou3CLsVeYeB94XT1el7EAxslFzZvFaM/Dg7+uCeHh2YrJOZGRzWW7h+5tn0wI9Q
	SMu1mmxbgj9o3SXPbxNd6Es/DQVLY+xj4V9xq1PnVqoLzJFD1M6xblWbDI9RpOhA47y9d9wN7r1
	kG0p3iPfeMJbTUZSwKf3AYsIMDAyWGrNza36atS3vzbvjmFlXjrsuf4pxSYkqx//AH5eFRlwFwe
	e4tjFmFPjPOz11LeZKEzCfm7+zf2DfmLiz9YqQGIizLx+3Q1UQ6XWI1iOdWZeWv42F4v/5kLmuP
	Hi70CzYGUUxbMIVRyeqXBfmpOhkIGAXUu76cQcCxm2ju7NZQK/sZ8CnwFjvEzIQr9TgbA2p1Hmr
	uycIBKUxwJGeGwvLu+QOAVVAxQaUeiCAGeFgGusQI5LlxDTkLVWwgSIVGu3el50FuKDvTQxXYwU
	Z2DutoCLabL57Dyy6ZomkLOZUOcViENzcG1Q4UcWQO8JqGC62b8yzs8+DTPjHEBngXA28grRgfn
	3i16Wl+Fu/HGsMK207JGb2pjPSNHry+F04ARHh89WvTVPDMqazQx2TsEuqu/2Joz+jAhCwslLiL
	27ebmLCL3739behItFY2+N3vFcVZ9z8JZwclvw6vx71dTyzfi71fE6CPvnnED+Hi
X-Received: by 2002:a05:6a20:ef03:b0:3e2:4350:1528 with SMTP id adf61e73a8af0-3f7a51ba2ffmr9092719637.7.1794862225898;
        Mon, 16 Nov 2026 12:50:25 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c847asm4527944a12.28.2026.11.16.12.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:50:25 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 12:50:24 -0800
Message-Id: <DMWXK2VTL3XP.MWW7ZG7Z6HUF@google.com>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, "Alex Mastro" <amastro@fb.com>,
 <dri-devel@lists.freedesktop.org>, <iommu@lists.linux.dev>,
 <kvm@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-pci@vger.kernel.org>, "Alex
 Williamson" <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Josh Hilke"
 <jrhilke@google.com>, "Kevin Tian" <kevin.tian@intel.com>, "Leon
 Romanovsky" <leon@kernel.org>, "Logan Gunthorpe" <logang@deltatee.com>,
 "Matt Evans" <mattev@meta.com>, "Matt Evans" <matt@ozlabs.org>, "Mina
 Almasry" <almasrymina@google.com>, "Shuah Khan" <shuah@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, "Vipin Sharma" <vipinsh@google.com>
Subject: Re: [RFC PATCH 0/7] vfio: selftests: Add peer-to-peer DMA selftest
From: "David Matlack" <dmatlack@google.com>
To: "Samiullah Khawaja" <skhawaja@google.com>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111192411.4133780-1-dmatlack@google.com>
 <avYjFfqr3T/U7lvn@devgpu015.cco6.facebook.com>
 <DMTK99TDM9AM.SAM3Z4COP9WS@google.com>
 <20261115231946.GB1239159@nvidia.com>
 <CALzav=efnA_ABCZVicX0QeTmHknaEbMeWOy8cS+zHYVhm5z+iw@mail.gmail.com>
 <avtI--OIZu5E5sma@google.com>
In-Reply-To: <avtI--OIZu5E5sma@google.com>

On Mon Nov 16, 2026 at 10:24 AM PST, Samiullah Khawaja wrote:
> On Mon, Nov 16, 2026 at 10:02:56AM -0800, David Matlack wrote:
>>Looks like GPUs and NVMe can do both as well.
>
> AFAIU the memory BARs for GPUs would need initialization. The internal
> VRAM needs to be exposed (mapped) to the BARs.
>
> Do you think we should have a P2P device "setup" step that can be
> implemented for various types of devices?

Yes, I think we need something like that.

I've been prototyping a new optional op in struct vfio_pci_driver_ops:

  /*
   * Set up a range of device memory, accessible through a BAR,
   * that other devices can target with P2P DMA and that the CPU
   * can access through mem_bar->vaddr.
   */
  int (*mem_bar_setup)(struct vfio_pci_device *device, u64 min_size,
                       struct vfio_pci_mem_bar *mem_bar);

vfio_pci_find_mem_bar() falls back to calling it when the device does
not match any entry in mem_bar_descs[], sanity checks the returned
range, and then runs the existing memory verification on it.
mem_bar_descs[] stays around for devices like pci-testdev that need no
setup.

For NVIDIA GPUs, I had an LLM work on it and the setup was simpler than
I expected, at least on Blackwell. BAR1 comes out of reset in physical
mode, where BAR1 offset N maps directly to VRAM physical address N
without going through the GPU MMU. The LLM confirmed this on by writing
VRAM through BAR1 and reading it back through the BAR0 PRAMIN window
(and vice versa) at offsets from 256MiB up to 178GiB.

The nv_falcon implementation only has to:

  - Wait for FSP to finish booting, which takes a few seconds after the
    reset VFIO does when the device is opened.
  - Make sure BAR1 is in physical mode.
  - Return the range of BAR1 that maps VRAM (the size comes from
    NV_USABLE_FB_SIZE_IN_MB), staying clear of firmware reservations at
    either end.

With that the P2P test passes with a ConnectX-7 (mlx5 driver) as the
initiator and B200 VRAM as the target.

A couple of open questions:

 1. The prototype allows .mem_bar_setup() to be called before .init().
    That is enough for GPUs, but as Jason described, mlx5 device memory
    has to be allocated from firmware, which needs the command interface
    and therefore init(). Supporting mlx5 as a target would mean running
    .mem_bar_setup() after .init().

 2. nv_falcon does not support Falcon DMA on Blackwell yet, so a B200
    can only be a target for now. That requires a driver to be able to
    probe a device that cannot do memcpy. I am not sure I want to go
    down that road.
