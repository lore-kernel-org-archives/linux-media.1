Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560392;
	b=3N225urLNuh5MRHkyq/jLnBqoOaGpo481p1FuHYpiv/6cwS6cd3ZJVd8v57qpJ+ehSUy
	 HWr3nHayEH5xhH0OaGLO/g+QBqfUpjYbzgovXRxE3JfLjkThr+qqtdEDlyHWUpMObJ8/r
	 7C6ykemD8Oo1Lb/wXnuImQiAhPLYAnqI5r83PpPekowgY902TccNa4nVA1CIwKMB0mGT8
	 R7Fhses+Wt4fceEKW4TtMG/R9toAbS9K0I3EFSf0EGGekXxtSbG1qSL6RPxCBwaYWgJ8X
	 qbUNvhjWMs60ndhHnjqDy+Yi8kpWnmOvLt7A4NMoYgDxFUYXDgUXRGk13u0Q2BZsHdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7rNzRbJ/55BT46qZauMU9GkZ1yJMZW1L/iinWzPbSDs=;
	b=NPbfTBmgGBKCKN7x1Nt53gD7vLjXgnX3vm/T/p32ISMaCiCe0gUbot7h6uqw40bN0sj+
	 ruJBu+ibmjHwjPm2TUBrmniJgt75Qr6uIBlUkeXPTyLgPfrMFgNz5YO8HJdZExYZrqUXt
	 P5iLM+56xtHmws7QvGIlPUpGw5VTWxOmZ8eYm/4Ss2O3ngfYF12Rbbglk1+GyOxMbB71k
	 1PY8ZEHEBqDWtayvnKxeavsTgWOYQUaJ3fvFq2ylwTnsv7imAfSPhDBKMZgScaiKRa6qa
	 vh1qeILch3TEhedfgQRj3g7Rxejt7gKn0tiHl3sVAVCl+xqjG8GyKxKyMp5bdl1azgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9DC606A321
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b31448caccso6234037b3.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560391; x=1795165191;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rNzRbJ/55BT46qZauMU9GkZ1yJMZW1L/iinWzPbSDs=;
        b=aw4dChNhwkeer2isC56BpQ+W8C1gceXXP7M2cmZMCTuwsFQ/+Iq53FcrSHNLNcyIdH
         dT2pjgVZlTRgVZXBdmc5Og3z3W8oQoUqsB737LXvUxaq01kjwojvNtVUraGTsCLqvLjQ
         7N7oi5wQwb3tlhd5fCAYFIVEnfRKmpoHwRkjlB3esvPec1p3vQTTVQpehp43H6mo4kVR
         jzNjhRza8LP8pwVBVOIz8Owhbx/PLzHjKN5aE3UhJYOPN1RGF53tPUoqkpRppkGcI5E2
         q0/LCLvHVtjqIOUc5mHOaX6Fcwe7FCJ1zG9vCY4YySLMbphNgptf5kOGw/F/DSDOpdIO
         gQWw==
X-Forwarded-Encrypted: i=1; AL+hErGhasE4Zchjrd/8fv1yo7C35QUAjn1UmulLPzFwtrqzVSR86AZXapwVP/2XnQdFVJvzku4rwJZUInRuGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/btEFzP8sMck0vkO25iXCiuC4OaduKYXwqxG5CP21w/zp7QbdK
	N6RDGMUoCqYsJaiYVSavTj/Jsv85LdfDEnYsgbnJZkdESQdNQBbqg/kT
X-Gm-Gg: AYBFou19J1A85VSjbHHvdYu5u0daKtIK/RQEolW4W1OUD3cUDHEiqCoIQf18HAZwkfE
	3EGqyLKdT2ELqYHzkGIKgIbm6zTCc8YfmwLLwCPtQXfctjuj/G4EN+4qC/gVQvlgIVZsnVC+T0m
	V1kXT0mQdSjrmTkkRvkDShrGxD5ONh/tAa2myf8Ywe5ZiaiEDMhdNg4Q4h7vZKvWoBmKmsL4suj
	lGDyyVGPl7m8AEfDu3IsRpWT/7dvU9KUm1JldQKBRuP1Mzf9DIQERSq0bDVtNOd8qk0xzbH4fn5
	MhWPPSPFhDAF7BMSOX2q0iCtBilX2/sudz04w1v9Np3p5E7tglSAUN6u1L7AQPo8P/2kUJowVF1
	gNqDlTYm/NfZ5lbcGpkKo5CWuTHUAiFatgv22cisayGP++Hi+3ObepKUzuS3tlHQTWwK6W2jZqr
	n4WWm1Fop8+nLOcwOPBCEW1z5fIm2nfnIwqYMhI4FkXNljbFhZ0n9GIMrqzaB6J8cOcYFAMaahK
	ThZVw+CmcwRiScTihbZbQCuJp0XR5wt8g+50qyv8KespSnZNIVJNxVAnhiwKvO5s1hhOXRiG45n
	Q7NQlpT7MylWGdiTOv6/RisX+VswoT7iXVJDfCVFjdk4g2Az1B6tqlOC5WrxVo+Hu44jdAaf7S+
	FMGbAzf4+WibtUGG69Hxad38YkSnfmjka
X-Received: by 2002:a05:690c:386:b0:8b1:e7c:cdcb with SMTP id 00721157ae682-8b4aa2f2467mr15379307b3.23.1794560390743;
        Fri, 13 Nov 2026 00:59:50 -0800 (PST)
Received: from localhost.localdomain ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7ee70csm15720497b3.6.2026.11.13.00.59.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Nov 2026 00:59:50 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
To: u.kleine-koenig@baylibre.com
Cc: dri-devel@lists.freedesktop.org,
	patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com,
	christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com,
	imagination@lists.freedesktop.org,
	frank.binns@imgtec.com,
	operatingsystemsdepression@gmail.com,
	matthew.brost@intel.com,
	dakr@kernel.org,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	linux-media@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 12/13] drm/powervr_sgx: Add the DRM driver, power management and debugging
Date: Fri, 13 Nov 2026 03:59:47 -0500
Message-ID: <20261113085947.62594-1-joseph@telaak.dev>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <avajebb1alBnAm8U@monoceros>
References: <avajebb1alBnAm8U@monoceros>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 07:23:36AM +0100, Uwe Kleine-König wrote:
> On Thu, Nov 12, 2026 at 05:59:02PM -0500, Joseph Telaak wrote:
> > +static const struct pci_device_id pvrsgx_pci_ids[] = {
> > +     { PCI_VDEVICE(INTEL, 0x089b), 545 },    /* CE5300 family: SGX545 */
>
> Please make this
>
>         { PCI_VDEVICE(INTEL, 0x089b), .driver_data = 545 },     /* CE5300 family: SGX545 */

Will do in v2.

> Don't include <linux/mod_devicetable.h>. of_device_id is already
> provided by <linux/of.h> and also by <linux/platform_device.h> without
> the useless dependencies that <linux/mod_devicetable.h> introduces.

Thanks, I'll drop it in v2, and check the other files for the same.

Joseph
