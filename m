Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195704;
	b=hyFgmEk12u52iqT2nXDznz5Ct1y825UTXyCnX+m6hloXwsk0jwpbD1U27Z79yqmeSeoD
	 6Nj8l2JAkkyISxQmWeQZK6CAjiHVMqanyE4llPybUJmMRoem3J3YUH4XuhClkBix9Em6w
	 QWgo2mEDoZiu8PJZcxVZcMgISzsHtLJuFvPE/54dJTZoZ8kgCp8NfkV6H5gmtK1iEo7oU
	 RYexaE+ZpV8Z/2AAROkVek4cgjoQq7SkaTfKPxWnGH/ytYoQd3OHsE6aITiLjzpK7Lxlx
	 gfFmigY8F0WfUyqn8bjliOyGiaMztHbwDBkmOHhmamiBLwjULujKiGtyJ8Q8bwH943g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n/R0PertKBznoGfoHPlQU/APASNGYYBgx2rkjYJOkqQ=;
	b=LGfrkaIxduqTnB7j4pqFXhQkqwTdp9i/gpAbChAvMf+47GxFlmmaDLvP5SLTeacX4/xi
	 85PQMZZFhryDobpJwxkp8FEbY1SLG5c5xb/wM2gXWdxD2bzLm7tbh84BDQAbUEoZ78LHz
	 0uJ5Wi2UqYkqGtBhSrlL/TU8Z6c7R2Cqnp9eWW1a4cHNsSEWsqQMde+TxEuEDOhZ7pje4
	 VTANX6ilMPCR4hbS7CXZzBdKgKk9GUi8OST0ULDNkswNTIDvCko5On/Y2ciCR/JTizPqk
	 uEgfwU3bTOy/RyfJ54+CLiJ9wfH7KmENEJVCELbpyWOQ9awy4MDoWr3nM/Q1JvJ+1BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVQm5TnP;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E29606A32A
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 17:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E29606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVQm5TnP
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49412eb1474so694814f8f.3
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 09:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795195703; x=1795800503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/R0PertKBznoGfoHPlQU/APASNGYYBgx2rkjYJOkqQ=;
        b=LVQm5TnPlU/crM9dwG0oHQaaaFDL3Hwe3WtHrCGasduNkPbLU2bx2rIPjQYUlDi4of
         2biRPi2qIvMR7H8hZPfZW8q0ob16ejPFMqOiVAXiDOTYW+oXPghUkOODA1XVkeRqlk9U
         4bynLJ+rZqcDrHtg6vg4jPBdn+GQzvzXCT/bf4gXsc/s2s4XuqiqvyEjkxv4ax7rzWmb
         dFzPyfiqOdYWY2OC5PtlGtFrJrgM9FhbR5S1QUU8uSA87FHfCYZIs940dlIeDUJnJjDY
         +ffIIM9EjDc/4EJ3NlujMWTzBvfIEDItpw4qChJFQrc0wNVvJtM0F6FgB/Uj7rIse+eA
         4ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195703; x=1795800503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/R0PertKBznoGfoHPlQU/APASNGYYBgx2rkjYJOkqQ=;
        b=q0rw+NhSfC1zeWTqWaGp1u/cSzC7XDdFZBUZml7JtCVA87T4B97QMdXfcdQ69df5eO
         BJzGG/GeeMPfLJwlNDV31vbp3cdl3kdct5T956K9YpZiWD7qVk+5g4VC7GbfyyTuZ5Ik
         Uti5LOJ5yaBXuqHbsTQoviVQbSTeMv6luGbf3x5NlI8bmR9vRIIIN0IIFvEH/zxGfNRN
         XtJJH7f96UmeeU3ONY5fiHlSrdipQ1X87ynd6QAs5LCxOPE5CFNMZ5SrN57rc7oVsb3Z
         kCgHeZ24iCFNQNyiGgsaJlAzS+USEmEb8DpGjCzbwMEEgyHTRtiI/g0jXu52pZ3fyPSV
         r9bw==
X-Forwarded-Encrypted: i=1; AL+hErFm3xOFYCBK7kjH4sV4ZCEzyps1zfjJBigJDQw6MflC2LSIL54N4hPYDzp4Xb+7DnTp2abVTOF6Xo8XCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8s8bhoLcFmJN+GB8bHe2+cwjQDOzI9PcrgGCh7/4EpOTiZDWYk
	eQBX9WNS0uT2/pIGUqVf1jnlMzmLNuBbiJRt3K+wkFTvGEYAMtnbpho5TscHjISq
X-Gm-Gg: AZFdTZcBRTJrtt6KK8l8owFryXG3oukIeNgcuG0RA71SNeXSX2qY1uvSheIkz9ZaZ4p
	CDrDsSwCcGAl7aNjaS1+nVV1+Kam3YE9LrpEwm1k//m+9Z1jkBKhoPc1MgvkM8FQ4P/R34k0UR1
	SWKIwtwjWnoPrqSPTVZDUfqGXzwVNs+ofC8GEkxLlDF1yuneG3/92nCaKuNUR9lULczd1FMBHD4
	W7FvRDK/xY7e+iMS2aYEtq5v9vyttIjQcabfvSPGe2w8rWWlCH0sC/NAecM2YCqYgKq0rGuODzK
	HacS4qJq5yIvd1kbEyZi99fVnD/XZtVNIP+6rMkcRg2fqJyifOoGDpcS5E1wS1O4lA1R5CjVmDg
	DsBV00ZZLHFKxkB9M3gduQbWEiVLTfNDOosTwey+3gqU208/6U7hFWuT29d3PyD0pEZbWTmrxjM
	AYC2NyyIGvM4ei/U7+PCz6htby7V+2cU8o8mZzZHP9g2mC7ReroStaf+19siLzw1dUvKv+L13fH
	SAHpcD5NPWUCBNGPmTp4tQ2jQ6J0lGs4VOaQt6jr0OKp3C6t9+3xre1hIdDPLaPzcvEQdGi5zk/
	NoNRGJIU5fi/BHEHAJc8v6PMz+JU617JZ/4J8W5N3vJ0JifFSeOlK1P5nzZ/1YBRxNPGZXLN6zR
	aj4jdJ6H+HkPPRdBdsZrFiiqyfUb3bM/0ERQohHsIy0LKqqrvdL/DSBjQJTBfvRP8
X-Received: by 2002:a05:6000:1788:b0:4a9:1649:9eaf with SMTP id ffacd0b85a97d-4abb86e5099mr7984738f8f.57.1795195702683;
        Fri, 20 Nov 2026 09:28:22 -0800 (PST)
Received: from PC-Marco.lan ([151.59.51.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm6670524f8f.50.2026.11.20.09.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:28:22 -0800 (PST)
From: Marco Ziliani <rylos78@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Chris Simpson <chris@nilk.net>,
	Tony Garcia <tony@loafecho.com>,
	Simon Kruse <simon0x+git@proton.me>,
	"D . Manresa" <dmanresa@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers on stream start
Date: Fri, 20 Nov 2026 18:28:19 +0100
Message-ID: <20261120172819.257562-1-rylos78@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <awAUxukyHCqtABs_@kekkonen.localdomain>
References: <awAUxukyHCqtABs_@kekkonen.localdomain>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

Thanks for the review.

On Fri, Nov 20, 2026 at 11:37:10AM +0200, Sakari Ailus wrote:
> This doesn't seem quite right. The static register list should be written
> on power-on and the rest when they change. Also there shouldn't be overlap
> between the register list and the registers programmatically determined by
> the driver.

There are three such overlaps in ov5693_global_regs today: 0x3820 and
0x3821 (FORMAT1/FORMAT2, whose binning and flip bits the driver sets
from the format and the flip controls) and 0x350b (the low byte of the
analogue gain). They predate this series, but I'll fix them in v3 with
a separate patch: drop 0x350b from the list, and let the driver program
0x3820/0x3821 whole, including the bits it doesn't manage today.

For the rest, I'd keep writing the mode registers on power-on as
before, and also write them from set_fmt() and set_selection() on the
active state when the sensor is powered, instead of on every stream
start. That needs pm_runtime_get_if_active() rather than the
pm_runtime_get_if_in_use() the controls use, so that a change made
during the autosuspend delay is written too. It fixes the same bug:
today a format change made while the sensor stays powered never reaches
the hardware.

Does that match what you had in mind?

Thanks,
Marco
