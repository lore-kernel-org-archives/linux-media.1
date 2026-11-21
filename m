Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267965;
	b=xcFK6Xd6vFFCNb6hx4vB+24rwq93NI4L3ZIx+qbMZ5oL/DIwC/3sG2Lm6Ne61GbkyG5k
	 w+gK9MCP8xP87ml5mNtntyqmeW9ORnaDUOo/+u2W/lhwCFxeVLKWFw52Ju3IAC2l7wTt3
	 uWHA75kjUhPOgiJt8n4SWwWLbFwbPC62pl06zdBFdnBKruoktaa3l/OfAYf/gcdPi8jPV
	 dv6UwapirgrN1QiXgWsWNrgZ5WG0wDD7A1ZOAnVfrwhd/U6jICo5uUeUQBrUZS+CwdBmH
	 ZXvC0BIa8KABwxd+ZwQMipw6yMXf2A1FHx+p/g3B/W1yPlrEhjoXwS3vfridN9bvyig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c3DsBgVi8DrQQ4XXQEryKDQ1UHFWr4n3CZ7L7GxpMVg=;
	b=PUF7Kh+oGWf12Yr0LZBXFsWsNUSxn94OkOyjeKuMfTft5z+tVLVn5bFcE4FRDI9RJ5+y
	 Msht9wKAFm1tPl5xubgPee7w88omWvSI48ToNyK60tDLYRm3HUpxSu3fqjXbu+MbXzIzk
	 oPvpNyNpUO0ViPv95DDEW9+WSq16+nDkIoq+p9I4gjkYb3ZtOVrbTY03M7R7k5fOOBl9G
	 xuZYyF9NQ2q0Ss+SXcUzekV4S8FWZLyG/dQddaNPOP5qt1Ojny78MAHyHC8DN4ChGLY0K
	 3u0VsRUGHaHH9bqUIQXcMYDdSwPlQWl2s98ijGfAPMzuPY8xwBqSE7S3Bk+rivRuQKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VF81DN6q;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A38606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 13:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2A38606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VF81DN6q
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12951965e9.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 05:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267963; x=1795872763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c3DsBgVi8DrQQ4XXQEryKDQ1UHFWr4n3CZ7L7GxpMVg=;
        b=VF81DN6qG7QAgQPzMK0294geDxWIXmfsjSXj4eBVPo+EgLmhA3oFLk6a4VTcClx2bs
         q+pWa+urrqP9T1Q9Hrg+c3wim9GzgAdfZeCLtu0vi1ymqov05pFs4HA7Tw7h25109DZo
         GdeQ6qfrWF7RIK+DhmpXvcNI9NVBL4sbEdc89chaxEBV3Q+OGedaol58zdEKvQd1nyPw
         6W9UPKMKKyqA0dU98TyHSzxMwa53AOJTO8KkqSMehuo0FGFbQHE0YrDleaK9Kr5mAjfO
         LCz9LU95qE+YhLsR4gsffYWTEkup14H0c3iycBPK+kjADcDVjvZUjeizXysfRdcTgNGr
         11hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267963; x=1795872763;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3DsBgVi8DrQQ4XXQEryKDQ1UHFWr4n3CZ7L7GxpMVg=;
        b=uLUXJUGHII5KymTHENX3uVary/XZCkO/2Dm+j6eQFmfQ9hLlilWIWdYdKSxXiG52eS
         0kukqvNZ6w1lpGjZcBugZB+9iACKP8Wy/TF/fi2gkmyFdcmiHL3L4VsL/9ZvMK4mV8nV
         2wrdrdc7HeAjJOJa+cu7lStoAVEOeYiquNFaoZJ5nHgydwipLiZcPnQBC+PL4o0GhHL2
         pJCHWIYY9cVA8Uqqop+ANnqvoMLU5zTPsgKHXxLD8n/xK7WqZxsRPcc87Lt2gmm3gxCM
         bggzmylU+kwoRKoVNeS34YrkJw6wj0B/ajvTWDB6IG3Yb+OqFWGGuQGtvh9PaiA8HFX6
         MfQQ==
X-Forwarded-Encrypted: i=1; AL+hErHC5gBFx7eCvdM9PtgBD+tS1zNSzl/SX50eSj/Bn1gRlfNIf+GAyH7tuUsErwHX8G/n2SB4DtR6dFcRXA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lEm1nT8KKniuxHn03ZUoQH9ezJlSHXEOcvhMLJcC2Ly6jgz/w
	TN+RC4zErKQ9aVJYV8Y+wzVX/cjb9XPeKHHb6HJXLD5nneGm6qM41kug
X-Gm-Gg: AZFdTZfjO45RpG2KJ9Rd2phlfvBwCdkQ+/Lna6yBbvME5YpOqGV9Mbqk0D3PdLBJonc
	2udvQ4bUi2M/CvjnuAOvq9kBMsyY85oKMhPir/YyaMPJ+dUHKuNLz/m47vKGAhU0p3AS6KqU79E
	tSX3n27kzuuCagTA8VTVrCKxS8mhjLLDE7zkdhVsWdMCyCoMs8RgWJcE8StzDZVGY5rQ+MYZ6u5
	QqromZuRG6NP8bf0XBnrhBM5CQ7uEciJlbA94I2zxnFg1sUAPBWgCGDHLpSsz80uA2ZqMUKcxVo
	wo97B9edK2j7wtQjKYWP1vWTMxRQVNfIa2Uluws+9EOo4yzrxWAesfyJWfQ9ESzKzEE3malKkfp
	USrWSDilwd5YKIoBMtml6orfRh3te/wfZ7l0ITArkTRiAZylvhsuFSYOCMwb0NTIcR41KkYv4XQ
	4VO5YhrypUeZOJLEzwo25VLrwCf11cTaFCmXm2lOiZLF9GGLF20cEGyrobnvjTn4lXfmN/+Z6fF
	Q3ASQwPIWnXIr8Pm+onfus7tKqb/7mj/5xrqiZVR64wtRr5Jbjm9FjnMsbaX3vOXwDzVWCkWDeL
	qrUP+0kdp19N5KGUVhpkpSqRa/UozukUiLjOndiaV2otKvzoBXAwS5IL/uOk+GkYbBPsSX8Xb47
	gTBFj4Hf3RFqk
X-Received: by 2002:a05:600c:4e0c:b0:4bb:875b:f23f with SMTP id 5b1f17b1804b1-4bb88827f0bmr130593125e9.33.1795267963076;
        Sat, 21 Nov 2026 05:32:43 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:42 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v10 00/15] media: Add Lenovo Yoga Book camera support
Date: Sat, 21 Nov 2026 14:31:28 +0100
Message-ID: <20261121133148.1240789-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
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

Hi all,

Thanks for the reviews. I made the following changes in the local
test series after reviewing the Media CI reports.

The rebase drops the OV2740 ACPI initializer cleanup and the OV8858
INT3477 match because both are already in media-next. The IPU bridge
uses the existing INT3477 entry and Andy's shared Cherry Trail PCI ID.
OV8858 19.2 MHz support is limited to four-lane R2A. I dropped both
sensors' proposed red and blue balance controls. I have a separate
reply on the clock register sources and the remaining 24 MHz testing.

The AtomISP CSI-2 timing code now uses div64_s64(). The i386 AtomISP
object builds and links with the kernel division helper and has no
compiler-supplied 64-bit division references.

RAW format enumeration now checks all the sensor media-bus codes.
RAW frame-size enumeration uses the requested bus code and leaves
crop sizes unpadded. TRY_FMT uses the same conversion padding rule as
S_FMT, including fallback to a native processed sensor format. I
tested those format cases with simulated sensor responses.

WV517S defers hardware access until first use and restores the last
successful focus value directly on resume. It balances the runtime
PM references and keeps its subdevice and control handler alive
through final release. The lens exposes only FOCUS_ABSOLUTE. Its
ringing-control mode is set internally. The actuator object built
with CONFIG_PM disabled. The WV517S lifetime change depends on
David Heidelberg's V4L2 subdevice release fix [1]. I used his
original posted patch as a separate prerequisite since the
media-next base lacks it.

The revised x86-64 kernel image and modules built, and the focused
Media objects passed Sparse. On the earlier 7.4.0-rc1 X91L build,
front, rear and front raw capture each produced 30 distinct frames.
RAW and processed TRY_FMT agreed with S_FMT. Compliance reported
40 passes and the same seven failures as the earlier kernel.

On the exact revised 7.4 image, both sensors and WV517S bound
automatically. Each camera delivered 30 distinct RAW frames and
20 distinct Preview YU12 frames before and after lens rebind.
The capture and sensor nodes survived the rebind, the held lens
descriptor closed cleanly after unbind, and focus writes worked
after rebind. The actuator returned to runtime suspend.

The revised series also fixes the V4L2 helper's rollback so a
failed lens registration preserves the existing sensor nodes.
I reproduced the old behavior and verified the fix with simulated
allocation, video-node registration and media-link failures.

One boot needed a manual front sensor reprobe after the initial
chip ID read returned -EREMOTEIO. On the next boot the front and
rear probes both completed on the first attempt. On a separate
boot, the front sensor read its chip ID before the rear driver
was loaded. The startup condition behind the earlier error is
still unresolved. The local OV2740 follow-up gives the chip ID read
a 100 ms polling window when the initial transfer is not acknowledged.
A wrong chip ID, an unrelated I2C error or a persistent NACK still
fails probe. A fixture verified the retry with simulated I2C
responses. On the X91L, both sensors bound automatically on three
warm reboots and three boots after a full shutdown with the retry
build. Each sensor delivered 30 distinct RAW frames and 20 distinct
direct YU12 frames in Preview per boot. The retry message never
appeared on the three cold boots or the two warm reboots with sensor
debug enabled. The third warm reboot used normal parameters. I am
keeping the retry out of the next revision pending evidence of the
failure and recovery on hardware.

The direct YU12 timeout occurred with AtomISP in Still capture.
Both sensors returned one complete frame in that mode. Switching
to Preview produced 20 distinct YU12 frames on each sensor, and
front NV12 also produced 20. Both desktop camera endpoints
produced 30 complete 1280x720 YUYV frames after a service restart
in the earlier trial.

The front-camera lane override remains scoped to the tested X91L.
I still need X91F firmware and hardware data before broadening it.

[1] https://lore.kernel.org/r/20260917-v4l2-release-fix-v1-1-acbac7f9b78e@ixit.cz/

With Best Regards,
Maurizio Casciano
