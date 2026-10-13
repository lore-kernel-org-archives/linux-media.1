Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A93C819D
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899837; cv=none; b=m42xcqFsQGoA4U/hRXcZ6tMzwOIy382LDNkACBVLrMW5QodZQiXnY2ddrvEcwxArGR2hdxS/D1uCQMDfdxqqIQO8yJKKtYDdJUisRpA7QzITFSNql6iytaFg/aBgoqHADDY8NnwW8Xo80m+IVtl4DAFwytcgoLIN/O6bv2auJvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899837; c=relaxed/simple;
	bh=Z86vlf1stssJR2C7Z95yj5K6zh8uVrp3C3OjL77R+S4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMcBtYimuu0GfffPtuCSDbdGdWiWu1pfsQeaIZZCdEPx8ebDCVWm5xA5XRb7FzWvhOE6i3AMgBk7JZ0M7Lk9RQP6S4y62LkU2WQVn+7UYl/5RFutoWWlnXXonxZCoFbvehHm+UJLJvt9x82LkzEi/Yi9u6fJoh/iG1StqlCW6Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s+OT87uE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+OT87uE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so21149465e9.3
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791899834; x=1792504634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z86vlf1stssJR2C7Z95yj5K6zh8uVrp3C3OjL77R+S4=;
        b=s+OT87uExonM5um1RG/4wEKgGIp3KQc/Q//zwpfx4E6MCylSIij0ZvOkEzqTTRDPoR
         lVDY7MhusS4DS7xRc+asqzIW2IuXefBTXnpn6WUl/6PQlGzq6F13cJSJ63SYu1GbFLjt
         VfmaWlPYaP2X/yAT8f9ZFAAOV2+5osDcTOiAQcbseUXm3cgATEQO2zU/V0Ba5KEc6hAv
         +jcnkyKQJfl9Zg/38kd7O1sBUm1xBlVECGV8GN6t99hGdEOzsLh6FNZGUQ1EBIGWSAZi
         3uEdCKeJsRcQG2yx4qkdqLhU9tMYjcIcs7ZL9yILf5UYztZdsKjF9/ItO8l8fxWbL0OT
         0f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791899834; x=1792504634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z86vlf1stssJR2C7Z95yj5K6zh8uVrp3C3OjL77R+S4=;
        b=AejPa9B1V63COz0X7UyxvcB+JeQ9Uh39HxegrQIF32o9dqIlf7/yb0VILMGLcqHyp7
         YcxgA1Ynt3A/kAEYfp9NzmNiUQxZT1SSAC9EC2vrCOdNolu/jZnsBDj1M1cUHs8odpDR
         HJvMX2fcbWne8o/ohVfde828ibKijU20w+CHLsWLnVCt0i98x0N9vAg6t7dhJ/mZPKrK
         CSkVO5H2tJeVzjmxrCdfIcJmgqvm7vkw6NeT9B9E+quGCTqS2LPfQHDmIo9V/Sam07eJ
         XPg5V5MQQ9GL15mxS+lZo08l8be7/HPX3edXC+B11cNWDunUfmzt20LBovTrvRCQCnN8
         xelQ==
X-Forwarded-Encrypted: i=1; AKwUvByvUYk1wUpOJHWduPaT0p6XD9uxlrJN9JTRaj7r0rfI5DMQdmFdEuWeU/hkJR4w1IMAGveSfQAwrxWpkg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJtPEOK5yFre6AQ5zbJinXyKlry95cChJxfbKriivcm6RS4F8SD
	rjJPhd0j9kveAkwkTAmfWh+k63daAm3yfqOguL/3Br+xA9Q9PQaaPTbq
X-Gm-Gg: AYBFou0zCXNSd/oaEN2h/3xk6xFaqY6/DEqfrFJ0X26vAbEek46DybX1zPIckbDJWbf
	m01cxATYycjZIFsKbjg267VuuvaZVs55nsn9JFYQTeSFwuae7AlhEm4W0sVf/LR12nBT2gR8BH9
	D2kPFBnUsR5JW1bngiplYXWQPe/I+I/rkS/bzMu+Ojz+ECouXAPeaBjHDD6iXpU/9Ika1MjKoBv
	ZKs9SQBEwKnPM8TO8kzS0qHn4hFSQhPZZKTiq9ezFbiDXQCp+LP4rL9Vfm/M5e4RSNJyJfZSyAL
	rplEX71A5UaWFn3+FOXUJWR+oyhMV55wYHugNVp9wOjWpySs4nZTDH9OtAC/r/qQIIFXo2qMVbk
	qf95RjGpRIGcnOCc1uI4Z+WKkOVrkzPV4JFZ+5bmU+JFeBybjFlEjOUq4A1QZUS3b4k3T2Hcqzf
	IadUjx/JP9QqGL+SyPNLEf64ZOoLW+wCVk9THckJpQVxcOJfOTklQUbTj3FLNsDa+NnOuq/J8P4
	iHhr9jxMO5p5Ra9XrTtizUsFqQtajT1Je1h/UqiTpInxVEIi/IueWa+d3eGzB24G2iNc8A7cGOe
	Yir6LBaO5fdsS6SeNs8jkRW7apNkmxvNM27ccAigVlp+UrUqvqlDVZF++P7MHwHC+7j+WJgKYdo
	9/S4D7Xk693hE1p72HODJZmC9/qQq5L4Mc3sVd49kL3DUF20Jj8AJ93eZqumc965Q
X-Received: by 2002:a05:600c:c0c6:b0:4a1:96cd:2f6b with SMTP id 5b1f17b1804b1-4a196cd31fbmr147757525e9.2.1791899833910;
        Tue, 13 Oct 2026 06:57:13 -0700 (PDT)
Received: from localhost.localdomain (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bead84esm364106285e9.13.2026.10.13.06.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:57:13 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicola Fiorillo <nicfio@gmail.com>,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	u.kleine-koenig@baylibre.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] media: Add GalaxyCore GC5035 and GC8034 sensor drivers
Date: Tue, 13 Oct 2026 15:56:22 +0200
Message-ID: <20261013135642.22269-1-nicfio@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013060129.GD56180@killaraus.ideasonboard.com>
References: <20261013060129.GD56180@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Laurent,

Understood, and thank you for the explanation. I am withdrawing this
series (and the v4l2-subdev fix as well).

The repository with the register dumps, measurements and test material
will stay available for a few weeks at
https://github.com/nic-fio/chuwi-hi10x1-cameras, in case anyone wants
to use it as a starting point.

Regards,
Nicola
