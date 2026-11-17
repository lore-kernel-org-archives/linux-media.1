Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938190;
	b=AGu2hFFPk71OTYhgILCrIrYPbflMrRfClXaKpscRylEqFmSNkVUshG2bFBxCuBr9rtAN
	 fY1HZ4Uo27Qf+eVIPc/1y5NFZVL1Ve/tfAg7XxU5mOmCEbhsv2Q/aFpQbmTkfS3jjphVT
	 In8cxZ/sBeriVAx/+Tz8OZI/kRn03w4Ox9HOovUk1A00WR9JJj0UrvfOcUN2lDhkX1A3E
	 mNscW9i/XKgX6DJ56Brbca+NjYUJQwJahgYL47j/PrjwX545PWtbps2W98XUQN1jC0hW7
	 SA5J0N0q7K8B82MHDknDwvQLrvZ+XgUdscatXy4Y4eLUzb076RLkYav3u81HPWIKUbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
	b=3j804qKFFupnQ1Cq2487ZASRJRJ6KZqnG+M0F8+Ys543KFhtRR9oDe5YTP+TSy3bPWOw
	 gDwv7I+ac26tcI3XsfG7Y1tjZPiN0mxZBjdtshKIxzuwpxFUrN35NbE//ycApSvf3Ree8
	 WiPsZaStzmgz8E2GTiJEXLVB1uM9WAG6bsKkr6SvpFf1OtrpPx1JVYc1j8OnanE06Mex4
	 AhjpbUnjDJaMFol/7XlDaRIeV2bHyjlURPJGbYhN8PP3lzpLXm65uuwO6m0tNinAx3JXx
	 rSalnHEfpQzwXAmiW7Fxr7M7FZq2moO62C1QlCYTWWYED+RnaUrtDch6wLGCj6Vrddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGgXECm1;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51214606A330
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 17:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51214606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGgXECm1
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso41536f8f.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 09:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938188; x=1795542988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
        b=bGgXECm1LP9RW5geQBlwXHQWEanPdLe5eA/jns5JvGNV17/XRn1NU8B1+HaJacOx5G
         +Q/7cGx76qwnPbRqUr381I24iBqBcHXkCaFJjmMXxOSk0wIkju/FnRbDxT5T2shLt7En
         OHOQhZvFompfSOMpuSMZ8Q3d/t6SMtQ5MewXXPxKfqDnffXqLfN0MZvaHDuV7ey+YkkU
         1KNy0EZf2AgevVQ1qNd1n4jYQEsWuMaPIKjDHsBTAJwDWi/AmFahlUqd7cpuSYUNtJgE
         kC9t6Hicc6pRXdY9DkSeBvMMT40nJdIfmPpRadUn+PzT6POBZ14sk0NzYkK3xBpUxzaU
         ad+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938188; x=1795542988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVlqUuDaHHbnxgwwnSebk+sIEp6EqZaEprfb4H4MTjo=;
        b=vi/O+4FuSgRYDjDN/I8RYEvYXJiombtezvlafeYrDqmqViVXdW7YDHikuEvB38orjD
         hRojlmRYfroAP3Cf2j6YOcYVVghujubicIcpZiHP60CnakNlcQV/FM7wOzvzRdFsNCBu
         vuzOUpvT199hGbJIN9IVEmKbRSyLrb2w8m29nhKUGE7knxphcllXTFrQfMbPtXby98Qo
         V17E1qM2ZbWTkwSTgno4iIgdWuhSQD5vg5mcHEKpfyeL3nUC4k4MpgW0Ok6c+ILVKbuu
         aEwFs8Y93pWz5PsKjBZq6avCuivdERCcXRxM8QV8hM120ddcZDocq1CNgiGRSsIO4fNw
         L3qg==
X-Forwarded-Encrypted: i=1; AL+hErHJYJRJCtfXYuxq8AurMYJEJLNhAOPPrX+0EoaFEY9qvTNyUX2bu3GtACXc3Re2AtAgzAyUueXPYlqMcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9KhaKbs1bXhhctKatwjV5wD6emUlOMebKy10rl6sKD6y1dqobg
	bZdj0ByAhMaAwVjUVaY8lY4yYIZikufjyQLCCUm8rYs+3owNxiyEqXf0
X-Gm-Gg: AZFdTZe5tHRiL8eGpgpm5Ws/BuC6Y3PuuJ+5Xm9I4PpabWfPpKYYB4h+KoFV54yGwSP
	sfok9WicAqiWFK5w+LBLefHlFhxKZCOi7nJOzExdBnuqr4bjnA8HqdpCN1eGSqigGpSywMHCVCb
	8lF8bgFfo3eh8pgbvJ+D2J8btqpYyxqS3j6oKOsRjgfE97K+KWbzr7YsnhRpzw5nL+aulgQSo6B
	ddAj1EiDJKqxzjML/g2I2I/nDvmuh+jrQNLhbPXIVucRB+zmMegCy27zF7/RcL0C1Zs8ZBQIcyB
	wy6/q9u/y4ZOn5pff/9NdpKbKARm7MWMOq5m1FJvqCvcff2qGD7j4EXMOVjOSrvxSSzR8g5M34A
	2jfnc25BX2RrdKe25nx3dBOTXVCsoqwXtsHKi/gjoFFIBIe0I8len1SB9AOXka1sp1Q3aBg5Sna
	k07nPobHCaZD2I9agAJEnYM33lzmUrO/Za2YtXfTioBRwK49tEu8PNsE9A6KQ86uH1sJMLVsoUe
	zIIGLCT4SR7rTwqVZqNAhFSw6viC5pOMog+hevkrDmwPYcXPzf+yJ65PfmIk6U3qxJxVQ+aOQnw
	C/eDcjFzdMAOkSTh3kuExVuE/xjnNzWdnyMsUyCw0YORvw==
X-Received: by 2002:a05:6000:26c7:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4a639ff6138mr506509f8f.32.1794938188531;
        Tue, 17 Nov 2026 09:56:28 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm47723f8f.18.2026.11.17.09.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:56:28 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: andriy.shevchenko@intel.com
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo ThinkPad 10 rear camera)
Date: Tue, 17 Nov 2026 17:56:14 +0000
Message-ID: <20261117175614.11710-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avwnh1o6rFzayxkj@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com> <avwnh1o6rFzayxkj@ashevche-desk.local>
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

Hi Andy,

On Tue, Nov 17, 2026 at 12:08:07PM +0200, Andy Shevchenko wrote:
> > Not supported: the voice coil motor (the firmware does not name its
> > type) and the LM3554 flash.
>
> Why not flash? It's in the kernel provided by drivers/leds/leds-lm355x.c

I should have mentioned that leds-lm355x cannot be used on this machine as
it is: it only probes with platform data (it has no ACPI or DT matching,
and nothing in the tree provides the platform data), it does not drive the
LM3554's HWEN enable line, which has to be raised here before the chip
responds, and it registers plain LED class devices rather than a flash
LED class device.

When atomisp's own LM3554 driver was removed in commit f1aa35ab5943
("media: atomisp: Drop the atomisp custom lm3554 flash driver"), the
commit message said it should be re-implemented with the
led-class-flash API if it turned out to be needed, so that is what I
did. The new driver binds to the same ACPI ID (INTCF1C) and uses the
same GPIO order (0 strobe, 1 torch, 2 enable) as the removed one.

I have sent it to linux-leds:

https://lore.kernel.org/linux-leds/20261116180809.26946-1-volodymyrchapman@gmail.com/

Whether that or extending leds-lm355x is the better way is up to the LED
maintainers; I will ask on that thread. In v2 of this series, I will reword
the cover letter to point to it. The VCM has since turned out to be a
DW9714 at the address listed in _CRS, and I have a follow-up patch for
it which I can include in v2.

Thanks,
Volodymyr
