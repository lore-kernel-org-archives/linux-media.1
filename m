Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794625444;
	b=q1ER9PnZKy/K4zbyrWXD5QTy0adOIOo/JeuAPe3pxq9+Ed3wEL0JB5eY4zYYTQ9Vx66D
	 iN8Lgp+Lp6fcPjNSN/9plN1pq4kDZp6pzl5tPUtgEv+MjCId7wVvVP6l2mJL/5Jy3wZ/j
	 jHJZU3itknyz6nX7489PyltWCBCk15kblWVt32lyR81wnokicRMLj6Bfy0Pzp2/J/srq7
	 Vsd9fRTlplq6q8zn/u8T+QD77W+ROm5cZh1WQlJXU/86997Ii/PBxYWLUNoftia737jpF
	 D/QjlbFP+bsm+/X+rS/41tmqitGz1n+VZzRd1+GX8N7xkmRpjqiCd3oPUMtTl51ZmoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
	b=PB6NtWv+Sw07w4TAcNaBmrfWgbvPd9r4KLrUMIY2boalyr8kk8bMYN5XdFjZgnRbn0h1
	 /5Jd4ROxqGUsK0TqzEDlsGBOr0b8e84wZp2gQOlHT+CUaLrdAFudO92bll0/viODtP8M3
	 LOtEMIa6w5VvEc2QzGq1RAkdCsTrI7RzJ4PFWY2dE5oTINfyYTRFanWu6x99IEnZt+PqK
	 XuNMZVXxAkPbXvdATJo/FvncVbO/pOIZHnMDDdZgctnT6H4DXyf1kfb1fD6Dd8ajt6viP
	 o/myB6WfBWPg4yvDGGtrhaNHC52H1W2uQmD+J4USXmLczqm2+vsNfq+9fK1i6cOuO0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPIZp877;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4530D606A333
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4530D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rPIZp877
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5ecd9a400cbso2016608e0c.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 19:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794625443; cv=none;
        d=google.com; s=arc-20260327;
        b=VrVYLuGsScwC+29+W5hORgaJEoPFNl/qAkVphfKM0RFNqj2g6U/n1Mi6WLWfGWNdgC
         ee3DK5/bkYzpSC+8nbUJvYMn6mrxcB1mJdsHRc9jCkK9aWBdg4J+JGKqKc6ijYdFoFL5
         XmvR+I/0VT96UgxP4hdZE+F0h3Ra38BcD2LY/nnfH50ps3pk8rBxt/IGVUUpCb0thio8
         w9cEiwAQvEWJ62mi/M/yKoNrB/HfZOUzK/HCqtepjCt6NwDDccT4qH1d2FWbRCK5pXgd
         WzdXgOnHSfzRZRhJIKKrk1sKjWTPJsHFNZCszXNYJzNXKGKWrtQRNoHMDJcZOnbtfbuK
         NSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        fh=JWoPyb9W99/CIqRUOpghcPeQfDE9o5C7Bkhsy45oXA0=;
        b=hMqz8bsL9zV2YdV+NK5Rj/GEWeWpLpcHbT3WYT/+LjJjFMKx5VzKijDwQHsCn/3W0f
         M88jJOqtRoDEcxDtVID7t/t8dVHNfuJvNfVPGyYjneYZ5wN/n+/PcXsuV/FEDp/pjyCr
         bWAiu3G/kGnenp8vxXmdhTYo8zw3mZBrGq0TFvJRj4ywnMCSbEuAshrOUSp1APhESlzd
         nh7mxREaUnAf1LiECrmDqgCmXIMM6iAvBErEwXjLAt2hztpWSWStkghjHadFN5uR8QeQ
         2ZtQ8DafalIYWBQdzRaJV5Ynz8vvhxD59qeBL4myl9fRU5rjrVCh3P9+NWE/pMKIj+OT
         ElPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794625443; x=1795230243; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        b=rPIZp877tbQadrv2K4Vdny2mnTvgojabbH0pC89G2N2VXWK2UblCcwVNZnefVmWrsh
         qi8EocyWwaeNwOMdyUWP+CMR+ku25SIAled6uR8iy9DP4MHF9U5TCuPjhrRzqbwjStN8
         GI3bvyaEYihscGofjMcWbaNmgumQwpVRxWrz4qHFkL5tDUvP31SR66hWFe1cjadhMbF/
         PXus2w3cNWiXDNJyZU+rTznOBnwZNnJmrf7JieXiAiuPR7kcwwfZYPSu08DxR7LYMTlI
         ogsqbdxph1x2Ux63+q5OdhjCFUQQdY3KwtXvW5PQCaQFRT4erJTdDyehBBT2tVJTj1jw
         KuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625443; x=1795230243;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XWwADe8GLoNoLjF/oyz1/OFei2FLfxnSw0Wa2LHuGjY=;
        b=SyRpvG1Cm/QD3qa5TGdw+aSkQdOpsh058807PvMCgHB19JnZZ3BQnmnrAWNKkZHsjS
         c+R1YDMemmj2v5yljIP0nxE2kdr985PM/ZVqtzRmBT/JW7kBHSmKLnKS3MLPr/B/7Gr4
         0qQdsx9zrlz/+dWU6709LlWm0OxjN+1UcHOxwoOP/rzZ3LhUaCNUmbIh1w6iYGvqAqRt
         VRYiQ7i7qINPzXkYR5m0jKGYJ2YqqF1RF0ydFa8NuIw98p+dlhCBfkV7a7YzjrrHxWkP
         5t7IfczT2Xf/uidycf0GZi/KKTjGRPnrbEEcME0t7MoW20PU23z+ZPmkwUxmDyqZalGs
         95ww==
X-Forwarded-Encrypted: i=1; AL+hErE1E8hEVDU+mCGapJjmzPdeGrfJiWfIlv3BRMCCFUgXm+fhk4guueeku2cHMxEYv+wAcpLWZhY+tWeL4w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vlinDd3hDvgS2kDyU3Sw6GQ1vhEqdRAwPaYwQN8lAKxKoNkEH
	6eePd/Qxxfy4yS7ZVFNwFe9l9DJMo/TldW1MQ/Gf5e3H+kHGwqi5NlthV8XI0+X/HcC7htCwd6r
	8AaqEwYx0B+X43D0P7Lw9As/sxm7Wg3I=
X-Gm-Gg: AYBFou23BpTkW8d/6TaZUXpzTjZ1P/HZT9mrajH8v+5hRjZ/7pD3ldDdlx0zPtvduEE
	I4uMC/wghojqJDTnQAEDB67tQcDEo2fkLpRocvTyYbxszT7QU8+ASioOBtFAdQvV4YAf/ZBdp9N
	6oqzt5Qm56HqDRoVxPUrJZBckmyzfNC9p4Wf2ubFIy+8jQtVbO0VNn0X+PdOvFrHrfFzv6VrSw3
	tT9wQAAMKq4iBe5IHn8mfldvtuWWwDTJp2/pYW26bo7LY9LHet/61VY98VgHsHLVKw3aXoPgu7q
	hufFVN6jRxQyOcvXydKT+izLY5y7/knbstWYFGRGVYEWfyWdThwt0VCXBVmOVbWcJw0LtRDc7qv
	Tx3LG5hyC9KctvYcnwc2uTskCQ0Odm7kZb6Y=
X-Received: by 2002:a05:6122:62a6:b0:5e5:1be6:e12c with SMTP id
 71dfb90a1353d-5ee34adabf7mr1759772e0c.21.1794625443218; Fri, 13 Nov 2026
 19:04:03 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827201611.99825-1-tchatard@gmail.com> <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
In-Reply-To: <be6f70a3-5792-4a4b-9f03-591869fb9786@uni-koeln.de>
From: Thierry Chatard <tchatard@gmail.com>
Date: Fri, 13 Nov 2026 19:03:52 -0800
X-Gm-Features: AclHuK_QHGedDaTSz4ALKjerOXJxyF7FrgwajFWtVN2oN2T1srpeliyS_lJ87qM
Message-ID: <CAB9TEqztrZ5TqRd3-iJpYiHBzK2rCh-jC9=XkTut1OV+Jf4Qag@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Enable cameras on Dell Latitude 5285 2-in-1
To: meisena2@uni-koeln.de
Cc: andriy.shevchenko@intel.com, djrscally@gmail.com, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, jacopo.mondi@ideasonboard.com, lee@kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, mchehab@kernel.org, 
	nicholas@rothemail.net, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com, v.vitovt@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Matthias,

Thanks a lot for testing on the 5290 and for the detailed report - great
that the front camera already comes up.

One thing worth flagging: the 5285 series has since been merged upstream
(mainline as of 7.4-rc1 - the mfd quirks via Lee's tree, the int3472 board
data and the media bits via the media tree). So there's no open series to
extend anymore; 5290 support would be a small follow-up on top of mainline
rather than an addition to this thread.

From your report the 5290 needs the same two pieces the 5285 did, so I
suggest two short patches:

1) mfd: intel-lpss: add Dell Latitude 5290 to the resource conflict quirk
- just another DMI entry in intel_lpss_quirk_dmi[]. This replaces the
acpi_enforce_resources=lax stand-in you used, so please test with the
real quirk entry rather than the boot parameter. Goes via Lee's tree.
Template: the 7275 commit that did exactly this,
495d5f41a6161dffafe61ac458459c62d440344a.

2) platform/x86: int3472: tps68470: add board data for Dell Latitude 5290
- a DMI entry in int3472_tps68470_board_data_table plus the board data.
Template: the 5285 board-data commit e605a094ff7a.

Two suggestions before sending:

- Please coordinate with Vitalii Tytskyi (CC'd) - his 5290 tree already
has 5290 board data and covers the rear camera (OV8858), so it is
better to reuse/validate that than to reuse the 7212 data. That also
gets the rear camera tested, which I think is still open on your side.

- Since you have the hardware, it is best that the patches come from you
(and/or Vitalii) with a Tested-by on the actual 5290 - board-data and
quirk patches really want to be tested on the machine, and I cannot do
that for the 5290.

I'm happy to review and give a Reviewed-by on the mfd quirk.

Thanks again,
Thierry

On Fri, Nov 13, 2026 04:04 PM, Matthias Eisenacher
<meisena2@uni-koeln.de> wrote:
>
> Hi Thierry,
>
> Thanks for this work. A short report from a Dell Latitude 5290 2-in-1
> (same platform as the 5285), in case it helps to extend this series
> to the 5290.
>
> I did not apply this series. Instead I tested the minimal changes
> needed for the front camera on the 5290:
>
> - Linux Mint 22 (Ubuntu 24.04 base), kernel 7.0.0-43-generic (HWE)
> - Added a DMI entry for "Latitude 5290 2-in-1" to
>    int3472_tps68470_board_data_table, reusing
>    dell_7212_tps68470_board_data
> - Booted with acpi_enforce_resources=lax as a stand-in for your
>    intel-lpss quirk. Without it I get the same I2C4 conflict as on
>    the 5285:
>
>    ACPI Warning: SystemMemory range 0x00000000FE028000-0x00000000FE0281FF
>    conflicts with OpRegion 0x00000000FE028000-0x00000000FE028207
>    (\_SB.PCI0.GEXP.BAR0)
>    intel-lpss INT3446:00: probe with driver intel-lpss failed with error -16
>
> With both changes the front camera (OV5670/INT3479) works: cam -l
> lists "Internal front camera (\_SB_.PCI0.LNK0)", and I get video via
> libcamerasrc/GStreamer and in Zoom (via libcamerify). The rear camera
> was not tested.
>
> DMI: sys_vendor "Dell Inc.", product_name "Latitude 5290 2-in-1",
> board 09WJPW.
>
> So the 5290 seems to need the same intel-lpss quirk plus board data.
> Vitalii's tree has 5290 board data; would it make sense to add the
> 5290 DMI matches to this series or to a follow-up? I'm happy to test
> patches on the 5290.
>
> Thanks,
> Matthias
