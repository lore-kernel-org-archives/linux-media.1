Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756CA3DDAFE
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 23:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872713; cv=none; b=MPI9n/3rMW45r8u/eDwT3Rdp3jQsFHe2na52tvKndDOUtboH37xj6OIGH4xeV/2iFYsVFxn4oQYaJa3iuy0proPDOqOcHU8P5TAJV+5FMukrRulGy8racX0DR+1IoQbwd0p15+q23aq3lwmhb+JVgO/IqXoNIPjxCcAweOeBs0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872713; c=relaxed/simple;
	bh=mBUn/hTP80ffwCIYg46mImDDtg9txT49wm8ZCCLAU4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYA0sW1Pa9Lu7MU0GoXLG0e0kPM7Xp3aAZaIMEriiEakvn7zizH/0vXmFnVAOH1tt+T/HcCRGiuQkyRelFor2kA2RzaCeh+1cFNeOJm4HO91wkI80XWq9yyD0LLOoHYg7+iSbPBZBoDZTUNFGAnLahZ4o8pqqBRLLMzlSBm3ldg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAkikBmM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAkikBmM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499840a2575so1870285e9.3
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 16:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872709; x=1788477509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AhzoEy5TUnSrE/sOnXMcYJ2l7J2sJrZcZgTYycYce7k=;
        b=IAkikBmMN3568YbCzZK04AQA2TLLMO8maw+eIU3aVqT24Uen6rZqTGTHC2JpdJJ5Jw
         IxCEkRs+/f7W6xbUsH9L4Vq4sz7L65bKu2UDHuzg67ekofroqgXlsmdMIvP8vsfuTfCl
         Qs2RCD++ZOfENzuXe7ctMODTGlTGfAF5ScIXNwnwyjYUN7KR5a7LoikUutQmjrlhtjb9
         HGLYdfhscWglWub7IaCA3kkjRDeToScM7H8KX6j3z/wqpRrMXWa77hQD6cZ6RgFoqyok
         rZRkjzCsr48Py2y08vt2ydq8e17oogluu2WNzIB3bAdQ19+pUegOQdIvp7kQYe53XyBJ
         c0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872709; x=1788477509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AhzoEy5TUnSrE/sOnXMcYJ2l7J2sJrZcZgTYycYce7k=;
        b=El0RKFs5ezNthyOuO8P8fDAmqcs/PyUdFdCXFh/7yjG3p4YvOdbTz4nBaNQG5Zu6Xr
         R8gnpz5nXeOy66DnsDnXNtRruBC7AD1dqMk6peB13LtcFczifKdzM86oGwQi6tc4HsRZ
         mLyxADyD/omHF42akJ5z38gQ8pVFpDRFoYKI1maYIyhKvRBZsa584GKrNpGsfyNlruk0
         6H1qWhgausQgiqf/Q59tbrwhSMAnOjFOrEKBD9HImnUHYWvvwOx+5bePRzwlN41iRbBN
         mfGH6VuSg/2j9Z/a6tuj0p5blyIjycVibFOK2JCwjjun4Gz6ZsUZ/q04ekAiFEf583LZ
         C5VA==
X-Forwarded-Encrypted: i=1; AHgh+Rq217kVClXiAN1dITqs0XWre59phxAATbizb2FDwTSTY2jM2NeP90w5F74DOGP/17RChVlECFP+6ac13w==@vger.kernel.org
X-Gm-Message-State: AFuF++lXxXZglsyi1laP3a1DE5r0T6mDBPjZLX284XuK5D4M6e1XM8Be
	GarubiP62bCB23jgJUUW4lrrAlvo4ukZ5lyB8BvOUaC7wf+aAr3bmWd7
X-Gm-Gg: AR+sD10YcA2mvC+T3Q3nsmb1paxtBA6PBU8i+PC1AVTWJVgnk1Dw5UXvfOCrMD+NqC7
	T77xVnV1fJv++g7F7HRz9hxqmsSG/3BUwYwqy9mujQAtsH8vBFt3SDiRVmUbbuWHT9FWe4a2F2w
	R5YDniQzyRN9F9b3p1qAZnQqktpVYFD2YtDGC99A5kuC+Z+4T6LHdt7bmNRUix7qM7YP7dAOE3q
	DUkTPF/302qGEVH8I2c/AbGmec+BuyLQo98mbE1+p6Se/hyhtoW5hpY6FcU6tsl/57dGerGn/gI
	IhUSd1JtYJSbHtcSc3SuvInfj6Y8/ko+njP3I31tT2bamN+ddAhEg6j5Ow5pa3OzcL1YpjgEQRd
	gDvnl11ubTcAr1Sw0Iu+qvc0aoxWQTlUjCKk/u5HyXvLZY1jU6wxNgve8PHKnCY68vNpTqwzwSg
	w8rle0i0wPyp7edUIBxs+MAHXWp6/F5QUqUG+lcXMWzx4amqbmvfp0AB1m0z1+4XlwtHKCX7y1O
	/aeBLtw5eOUe+Ko1JLQF6mgp+BZ16WdeOBC4GlQceo7
X-Received: by 2002:a05:600c:8b8c:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-49b91c21bc7mr29918525e9.4.1787872709574;
        Thu, 27 Aug 2026 16:18:29 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm6748875e9.12.2026.08.27.16.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:18:29 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Date: Fri, 28 Aug 2026 01:18:24 +0200
Message-ID: <yogabook-media-acpi-dsdt-20260828.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <apAKR_wiAUhI0ZQn@ashevche-desk.local>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com> <20260826132256.3343451-3-mauriziocasciano7@gmail.com> <apAKR_wiAUhI0ZQn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

As requested, the relevant device objects from the tablet DSDT are:

    Device (CA11)
    {
        Name (_ADR, Zero)
        Name (_HID, "INT3477")
        Name (_CID, "OVTI8858")
        Name (_SUB, "INTL0000")
        Name (_DDN, "OV8858")
        Name (_UID, One)
    }

    Device (CA01)
    {
        Name (_ADR, Zero)
        Name (_HID, "OVTI2740")
        Name (_CID, "OVTI2740")
        Name (_SUB, "INTL0000")
        Name (_DDN, "OV2740")
        Name (_UID, One)
    }

The per-driver ACPI ID patches are included in the v3 series sent as a
fresh thread.

With Best Regards,
Maurizio Casciano
