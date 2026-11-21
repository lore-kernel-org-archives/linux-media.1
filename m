Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267967;
	b=BbiBUSx89vfTKILs4jVxFEXNp+SlNuttdHNQRbSDMzeA0/r1bH4sYF+1JAb6MGWqAcen
	 BSc33ZKg3Ih0wzcHhD3vbC9AnXzeADqsq24vkPOFYnf+ip9utxt39jBCKjYDIxuKAYJlW
	 VPMvo7GEBPumXaBXtMn/EJWvecuSRtP7BJWIxXnQDhcQk/m33n8kOeOKDAgeiBLlPtNNK
	 M5vP5hUZRVSS50qXP8CiWSTI0cITQQ6vYGknvcLc3fVwvSrOWZzMv+MF44cTkm/aZJ+Fw
	 Gcml3s7AxmlZkdkFdopPz/ltNyPs5qCr7B5ztCokUdy8WtF0YJeZVBcv/SbjbpGsawA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Utfdnddl3HrhLFxOssPYnL8n9jheBCeiU8VtWG/2YVE=;
	b=Hue/6JygiW4iwx0PO05M/eFOYB2OiMrZ/SNXLWF2d+sovL1fafXx4ao/qsFpfIQ1Ra9U
	 0rMYOcTWWRPaQ5J4stiQP7cNBhLod4pap7N4OsMOXmqA1fZFdTWYqMHExwBDF2sPAgNMs
	 Qsc5itTFWF5F5RUQ3pX9womDoUg6gHrA1aCSp3MA2532hGIG5q2Gg4qb5BnKzSoLm1kqd
	 Rl6rY8HFVl5pY371XXvFweRb8gUCPXjvQfEyAwRyQSCNFBOCjdAGoAvF0GBJ915BxA9iO
	 /HO7vfYPvNi0QOQC0k6BBS3oCg8KWwmsxQighSD2cKgULbBpNVQs1qCutu0aQNW+42Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR5b2LLC;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02859606A339
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02859606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR5b2LLC
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso26037625e9.0
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267965; x=1795872765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Utfdnddl3HrhLFxOssPYnL8n9jheBCeiU8VtWG/2YVE=;
        b=wR5b2LLCowQ+DDbf9UqGMo7lcD/FqSxAmG8BysVugR+7eRbYaZ+SfVk8XWzm5ncx00
         uW5Oirb0lWwrOq0de+K5KgDGnxgr/0G1HVrOQZIwD3BLu2aM5SdFpw7d3cnKFJgCDFYE
         2uzmLnZWNfyeb8COKbsvduwqqQ9BzYix08bjoEmwZvHd86RCzWrzaIIONVLKQ//YsbLP
         PEA0dHDYaz+BmT35dEQBsnJOKsP+NCjCFH5edYSyAHnvf0NSbQPC4x21Yi5Jo4+E+cuv
         nzJLETz8Ct33yIUy2W4ep6LbL5dwFY8/6Yu6EuKHqG3KPd0qbPLdkVhXbe4Xmfp2Z8QE
         Oo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267965; x=1795872765;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Utfdnddl3HrhLFxOssPYnL8n9jheBCeiU8VtWG/2YVE=;
        b=pdKOcoF8910Uph8m4yZKFMX6UWO6IYuNxeArpJsgPxrM7yo5ruz06tvgSYcvR5x7MS
         aomUi/75idFiDBast6YNBYEbL7MAscL35uvSsEir6TM2M939gPlFm88EEyfMcWFtI9BB
         x/oUFwYcncm/z8hhx2N7ccomuj4hDK7hg+rJESlEl6bZ28VYF7+52a47zXFalhR+cSq/
         0G75btXji92srcskmA/z7EPjhqnPE4f6GF500Bqf/77IIGHgl+JKYnAQzKwARU899Tlq
         VcX6Aeac1JFVhf3rCpEV2Q7FkRQlp8PnDQkOH/RToaJ5GBPqyPPgTSd9vZFRQDkvPjZa
         mArw==
X-Forwarded-Encrypted: i=1; AL+hErHC4rz+ZMAxtT7lGMgg/RptR3wav1v24Uvl0ttRT7AnhaUt6Bides1Bz8OXPrX9M2Na8gqYc6Z6DXzAaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9WRTrRddJxHLWaGrtIxH7ifzx4fSlPUagx6r1Ky8HMomvnLesw
	sbAZCu+r6Dm09wFD9+Esn4HZfD01p3gMHPEatTDHn8NsBEOMbyxXijtI
X-Gm-Gg: AZFdTZffwH4vUhdizXSFVuO4gTYP86UFum2onJMbpOystkBS9TCNqeQNos3iAm6LF4t
	cFRMgJb2IY+y0a/rNKK4HMgW6pqyCKfV1WjQCpDWP3ZrjBZrXLHm3y4RXGXRUf1DG9X/OASd1Y2
	1k3NhyN2Zu2YDkACPAAfGmlOkEqSplJ/+3tiUSxcv/EmPqFPw+Fyo3PrGGkXfZzOQ6MrCom1Np9
	IqQEZRoCcPNsh5BEr3sL5d594lt6YsLMS2pd0r47cEOfCJTJIYZIWDp8mFqThN8OQYAwt7djuoG
	1MXCqrj03LRCLmiL81s2np/x9H5ZGJiAlhf9uT4yB+YPJYm+rtpgDHNN48VNZ7bUFLApX2CG+KY
	hq05Fs8Cq1m6iOPmNBV+MpGoViKHFN1NsCYmxfWIwqVax4AqwQSGn/USk/etylbgrS/SSIEG8yu
	dm2lbHrbal25vcUCzEW7oyoEom9Tv3QsLMFNoGhjJtY6LxRK3zrGRwzIygX5cDVfoQkijdioopc
	vgkVzidnDKWsNn7q62SciwQbGPEZZc1k0DG7fPsYIEVN9316umQjBSazEKuMMe0F5SiNAQc4QvZ
	t30f+/2AACFEoIeCOphVgJqP5ZVYEevNxl0Nar+kIJwmtgeO6hrZZLKaGmkzDRgXB+ZwW2OkAEP
	iBPfqu7GG77/7
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr136284285e9.13.1795267965131;
        Sat, 21 Nov 2026 05:32:45 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:44 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 02/15] media: ov8858: support 19.2 MHz clock and manual white balance
Date: Sat, 21 Nov 2026 14:31:29 +0100
Message-ID: <20261121133148.1240789-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112212234.GA699509@killaraus.ideasonboard.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com> <20261002-submission-media-yogabook-v10-b4-final-v10-2-817ec765b257@gmail.com> <avYp7y9Vvh2Oo5c6@valkosipuli.retiisi.eu> <20261112212234.GA699509@killaraus.ideasonboard.com>
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

Hi Sakari and Laurent,

Thanks for the review. I split the OV8858 clock support out into a
local test patch.

> Any others notices that should be added?

The 2017 Intel notice in v10 came from the OV5670 manual white-balance
code, which I dropped from the clock-only change. The retained OV8858
register table matches 18 of 23 address/value pairs in Intel's GPLv2
OV8858 initialization table from the Yoga Book vendor kernel [1].
One more pair, 0x3f08 = 0x08, is also present in the existing Linux
OV8858 driver. I can trace the four changed PLL values (0x0300, 0x0302,
0x030b and 0x030d) back to the first public Yoga Book patch. Their
earlier source is still unverified. The revised clock-only patch
cites [1], carries its 2014 Intel OV8858 notice and records where
the four adjusted values first appeared. I removed the notice
that came with the dropped OV5670 manual white-balance code.

> The Assisted-by: tags are no longer used, please remove them.

I removed those trailers from the local series and kept the description
of Codex's contribution in the clock patch commit message.

> The 24 MHz configurations are lane number (and variant) dependent.

The only 19.2 MHz configuration I have is for an OV8858 R2A with four
data lanes and a 360 MHz link frequency. The test patch rejects other
revision and lane combinations at 19.2 MHz. At 24 MHz it retains the
existing register values for R1A with two lanes and R2A with two or four
lanes. I compared the table writes and final values for both modes in
each configuration. The clock writes move later in the sequence, and
24 MHz still needs a hardware test.

The Media CI review of v10 patch 02 flagged the same issue [2]. The
unconditional 19.2 MHz table selection in v10 could replace the PLL
settings chosen for a two-lane sensor. The revision and lane check in
the local patch prevents that override.

Laurent wrote:
> That's indeed not a good UAPI.

I dropped the red and blue balance controls from both sensor changes
in the local series. The existing scalar digital-gain control remains.
Any proposal for per-component gain can be reviewed separately.

On the X91L with the local 7.4.0-rc1 integration kernel, raw capture
produced 30 distinct frames on each pass in a front, rear, front test.
The rear OV8858 ran with four lanes at a 360 MHz link frequency. On
the front capture node, v4l2-compliance reported 40 passes, 7 failures
and no warnings. The same seven checks failed with the same diagnostics
on the 7.2 baseline using the same node, camera and tool version.
I repeated the capture sequence with the AtomISP and WV517S fixes in
place after retrying the front sensor probe.
On the exact revised 7.4 image, OV8858 bound automatically and
captured 30 distinct rear RAW frames before and after lens rebind.

[1] https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/external_drivers/camera/drivers/media/i2c/ov8858.h
[2] https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/PWB2NAGYQ7EZVEDZNXK3R3UKZ7GGYAQY/

With Best Regards,
Maurizio Casciano
