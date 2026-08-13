Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F313D9025
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786647300; cv=pass; b=aseesNMc8jQlQqYXss/iZ7mmveNEkpbhByIOv3UzjxxRl1j2JD71HZc3VEntUAg+j+rfKX3gkuCvXkhfJcyzuOz8m2SsUiYmjTa+vwF9s1e7aFO7y0nanX7zyRXqVOHemoK6Vyd77jFWzlVTZ93YkJFI/27UPJ7VPN2fn+mZYUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786647300; c=relaxed/simple;
	bh=ON5vU6mv2LieBfqdHEVNItzTCxMkyj9Yr93Lu/CPvP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPEHdrdZbdy1cfLy6SSV11UMzKF35BnSxhfA+NvylKwxHBYs91zkOAyguZ9BLXbGgyWJQv/HLn7OIXCknOSc3ycc5LC+daoT+554Rj+cKlfaB6WVFs67gNG9MnKrQGT13oiLSxnf2m5tQNJs4FeRod32TX0/TvS84RKXUkgzxhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dy9erRAw; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dy9erRAw"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8612812170so8421a12.2
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 11:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786647298; cv=none;
        d=google.com; s=arc-20260327;
        b=DTAr/sTqYbS1DH0tx7GUh3h/4G2/70HZwSgP1ZH/tW5dqlDTGVrSI9AwnW6hU7XFQs
         Jqf2TzD5E5fvzf5QR+CuvwmCYwMgvGiV2Bt7nMIB663tTkoZyOdxcd2K8YaTrMNTUXep
         IjZaYKLIs06/mV3TnjzaxvCn7I2FURSAmhtIUzUEIymXklZXpugLEAspvVPCtdJkeDDQ
         39IzHN0jTuZZkXV2sedXc1kGncYL9qzpLwEwJMm4Mu0adnf4EVTcsLnLPatZMGZeaww1
         HsuColbn4zG3kXW+E1Uw6KTfkMuMO+cuKYxAQpHssfo0rHvjBtYD/u9kznf5KOOUBxbr
         ortQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ys42dbnu0/ICx4BZSSpRiOGzHCv3bwg46ovXH3mc4po=;
        fh=AJn9dcxUijcBepCtKduWOu2AJXnat0zFBDU6jfvdNN4=;
        b=m8DZoPHZIRfuMVKen8fOeru9Usi5Luue4tbrd2g9wI3Au741nolDhb2cPIju/mT1Ga
         iyun4XKvG86aSCdzp4mGtXHzhW86QGmZy+vcMSiYnWwJTYYpMcNTpcTbS5foAOddcVzC
         Ky9mZNyovi0sTUu+cbiwUXmrvgeO0GkJ/VNPmgxl9RfzlVZphQN3+HH5Wdcr+PgpOgRu
         iDJP1LF5G/S0LNc6KM1xntjrXZTcSJqF0JhuecmkbJqExMK0AkQcgn5YymRXbkVhmXL5
         wUwLjUG1PpmVgX/jG7OVMdh9V/MxGNJH3BDEx0Bgy8PySTt0T8A+LK0HyICt8QdxQBgM
         hnEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786647298; x=1787252098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ys42dbnu0/ICx4BZSSpRiOGzHCv3bwg46ovXH3mc4po=;
        b=Dy9erRAwBEiidHEiTfTxQNK82QeGyojIAtXsAkT2jlkYGfTMJ+TKEZRoYhPNsqy6oj
         vcIa6lBKOZUB91RHbl+qTHSD/UQyAiYah6rxxpLzqjYiiXx/ipm9TlMaSRI8AhmS4+tT
         CUCE7dKr9BwT/7gkPazSyoPTk+UDXugibfWaVv0lt3n4YQ1D1MN2gmVh678sR4BxcAGs
         6niR7uU7N8qK8Uz23ngCP8tlul6DyocZPt4Q3YmFCPCJNfBCf2C7nkOU+BeIjVE4ecZc
         o09t1DYq5OcSKqQ3YbFN/cGFLWU27VRXg/7zttrBhN6dEsKvZs1ETrgQ25yRVeDNQI38
         +MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786647298; x=1787252098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ys42dbnu0/ICx4BZSSpRiOGzHCv3bwg46ovXH3mc4po=;
        b=f0CgSYRVWQVgzblRGuSeqG32tndED8nYVxNeyJo+Y2cXbwcxVh2CU6KFsT4/LyR36i
         EVyK//h7pHPLVvL/14hmWpKdgoJ5ZXV1ruFIdDYhzacEggI0yoj6kjVQhY+c4p9o3q11
         /q0jTAH5biRpIDLnYT/SVPlGqwSdETpXdMc1CLJm3CBxoyOKsBN115Af5e+7bQHT2hsx
         8xjobofy1wvN7vvyfQAfm+AiSY8D/HLspJcxjOBBZv4jutlEIgkPrKFP3afBBWI0gnkS
         cCwiyTtTHRwnuh0I6Udjhr5I6NYTwPkIyHkpBOhFYQNkTQBI0OYXQe/TFDN2pMlFf8gV
         K4sQ==
X-Forwarded-Encrypted: i=1; AHgh+RpzdxI25L94SLcjsu4rBKthzHCa6jMtGpdI9m65QDdEvZMLI59VjLZlwO7UaSQ9ZnhOa+/yc4kTWlh7zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ZST5Ign/qOHDKJ4OS/fHYyl+Yhi+8sTW5D7QEQIrLUNkUNPd
	dVjtOWiA9Wc0Foak6JHH5OfHCogrgum/xLMu9FVZuXtDJx/BiCjlEPahapRXLOGg4Mzd8keGOow
	AildKo6xsLchiy7DPCOI/zPJC0KelCGI=
X-Gm-Gg: AR+sD10e61lkjyOnfzCdbxdFD4MnmusaJp8MnUm+yYvIwxncaOF6DfCtXqbls+EvZmt
	PS6VpDlZEnp2NCeXx86h+oJwFE8418k/Y0llK6eZ/rPlwZqcMdP7RQgxMvo2qfreD3NMve2Fae4
	Q1HcKJzx8VSwFGCGsvu+7YdUMj9EAHnffKXLFUbglTJ3tLaeWjsktBImbk/Rl299nfT8i2z80Nw
	rN+m2fDDweBx9A7PYS5rlnx4uH7R3XQBx8cO4Q4+hnHExT4QYb5Z0JT86OQ6mKVKovnpvT/Ba3Z
	ulhzICwsLeaNluwol9nkF2fweV6oHl1imZAQPBZODJfbCFBCdSWMfmYHxoV7Kpstiw6A52YVstc
	q/nQ7vAJARUngcZk+2ZlpOkhTSQZfquw=
X-Received: by 2002:a17:90b:1c91:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-3933b4d0640mr179244a91.0.1786647298317; Thu, 13 Aug 2026
 11:54:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811231351.1011244-1-taimuraz@kaitmazov.com>
 <ee663474-5de0-4ffe-8ac1-1dcdff5dbc28@amd.com> <224dd281-da48-84b3-a048-016b51aa0362@amd.com>
 <a505f9e5-b416-43e9-934d-c5c29b8a70e9@amd.com> <9420bbe5-46a3-84be-eae8-596bc42bddac@amd.com>
In-Reply-To: <9420bbe5-46a3-84be-eae8-596bc42bddac@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Aug 2026 14:54:46 -0400
X-Gm-Features: AUfX_mx_auIKOQjmwN2CvsU15Mwo-xw_9T-mFr-sYw0GjTAJECthI8fgD4LDjdE
Message-ID: <CADnq5_OR5bFoFJoMoj9bc2_f47TunVnDFrmA_2tT+0k-DZk_jw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] accel/amdxdna: honour the SYNC_BO range
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Taimuraz Kaitmazov <taimuraz@kaitmazov.com>, mamin506@gmail.com, ogabbay@kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	sumit.semwal@linaro.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, "Zhen, Max" <Max.Zhen@amd.com>, 
	"Santan, Sonal" <sonal.santan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 2:45=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote=
:
>
>
> On 8/13/26 00:44, Christian K=C3=B6nig wrote:
> > Hi Lizhi,
> >
> > yeah that sounds reasonable.
> Thanks. :)
> >
> > An alternative would be to use DMA_BUF_IOCTL_SYNC from userspace, but t=
hat is usually only for the exporter to implement clflush or similar action=
s. As importer you need to be able to take the data as it is.
> >
> > We have discussed before if that shouldn't be changed somehow, but so f=
ar didn't settled on an interface.
> >
> > Question is why do you need clflush in the first place? The NPU is a PC=
Ie device, isn't it? And so it should be using cache coherent memory access=
es.
>
> I do not know the hardware detail. The legacy NPU device is not cache
> coherent. And the next generation (aie4) devices will be cache coherent.
>

The CPU wouldn't be coherent with device caches, but the device should
be coherent with the CPU's caches.  I.e., PCIe transactions from the
device should snoop the CPU's cache.  Otherwise, you couldn't use CPU
cached memory for DMA.

Alex

>
> Lizhi
>
> >
> > Regards,
> > Christian.
> >
> > On 8/12/26 17:45, Lizhi Hou wrote:
> >> Hi Christian,
> >>
> >> Thanks for pointing this out.
> >>
> >> Taimuraz, this is not introduced by your patch. And the current code v=
iolates dma-buf protocol. It look we need to unconditionally return -EOPNOT=
SUPP for imported BO at the beginning of amdxdna_flush_bo(). Could you help=
 to modify your patch 1 for this if it makes sense?
> >>
> >>
> >> Thanks,
> >>
> >> Lizhi
> >>
> >> On 8/12/26 01:57, Christian K=C3=B6nig wrote:
> >>> On 8/12/26 01:13, Taimuraz Kaitmazov wrote:
> >>>> SYNC_BO carries an offset and a size, but amdxdna_flush_bo() honours=
 them
> >>>> only on the vmap path. An imported BO is tested for first and flushe=
s its
> >>>> whole scatterlist,
> >>> Absolutely clear NAK to that from a DMA-buf maintainer side.
> >>>
> >>> Flushing on imported scatterlist of a DMA-buf is a really big NO-GO.
> >>>
> >>> If DMA-buf imports are used with the device then the device needs to =
be able to coherently access the underlying memory.
> >>>
> >>> In other words you *CAN'T* call drm_clflush_pages() on imported memor=
y.
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> so a sync costs what the BO is worth rather than what
> >>>> the caller asked to maintain: on npu4 an imported 64 MiB BO cost 105=
6 us
> >>>> to sync at every size from 4 KiB up. Patch 5 reorders the arms so th=
e
> >>>> vmap path is tried first, and indexes the page-array fallback from t=
he
> >>>> requested offset.
> >>>>
> >>>> The four before it are the ground that has to be solid first. Patch =
1
> >>>> refuses an I/O memory mapping, which the driver currently stores as =
if it
> >>>> were an ordinary kernel address. Patch 2 adds a probe that does not =
log,
> >>>> so patch 5 does not make an exporter without a vmap op print on ever=
y
> >>>> ioctl. Patches 3 and 4 fix two ways the ioctl mishandles its own ran=
ge: a
> >>>> zero length reaching drm_clflush_virt_range(), and an offset and siz=
e
> >>>> added to the BO address without an overflow check, one level above a
> >>>> function that checks the same arithmetic. All four stand on their ow=
n and
> >>>> can be taken separately; only patch 5 depends on them.
> >>>>
> >>>> v1 did not reach dri-devel, so this is the first version visible the=
re.
> >>>> It is on lore via the other lists it was copied to:
> >>>> https://lore.kernel.org/lkml/20260811204556.875037-1-taimuraz@kaitma=
zov.com/
> >>>>
> >>>> Changes in v2:
> >>>>    - patch 2: take the device from the GEM object rather than abo->c=
lient.
> >>>>      amdxdna_gem_obj_close() clears that pointer under abo->lock, wh=
ich the
> >>>>      pre-split code held across the log and the split did not.
> >>>>    - new patch 3: return early from a zero-length flush.
> >>>>    - new patch 4: check the sync range for overflow on a device BO.
> >>>>    - patch 5: say why the persistent mapping adds no pin.
> >>>>
> >>>> The measurements in patch 5 were taken with the equivalent change in
> >>>> AMD's out-of-tree xdna-driver, where this merged as #1541. That vers=
ion
> >>>> and this one differ only in a page-array fallback mainline has no fi=
eld
> >>>> for, reached when the mapping fails and the BO is neither imported n=
or
> >>>> shmem backed, and in the name of the mapping helper. The flush and t=
he
> >>>> helper are otherwise identical. This version is compile-tested; it h=
as
> >>>> not been booted.
> >>>>
> >>>> Patch 1 is from inspection rather than a reproducer. The exporter I =
can
> >>>> test against is amdgpu, and amdgpu is the case that cannot reach it:=
 it
> >>>> implements .pin, so a non peer to peer attachment like this driver's
> >>>> forces the buffer to GTT before anything maps it. Reproducing it nee=
ds a
> >>>> GPU whose exporter has no .pin, which I do not have paired with an N=
PU
> >>>> here.
> >>>>
> >>>> Taimuraz Kaitmazov (5):
> >>>>     accel/amdxdna: refuse an I/O memory mapping of an imported BO
> >>>>     accel/amdxdna: add a quiet variant of amdxdna_gem_vmap()
> >>>>     accel/amdxdna: return early from a zero-length flush
> >>>>     accel/amdxdna: check the sync range for overflow on a device BO
> >>>>     accel/amdxdna: flush only the requested range in amdxdna_flush_b=
o
> >>>>
> >>>>    drivers/accel/amdxdna/amdxdna_gem.c | 66 +++++++++++++++++++++---=
-----
> >>>>    1 file changed, 49 insertions(+), 17 deletions(-)
> >>>>
> >>>> --
> >>>> 2.55.0
> >>>>
