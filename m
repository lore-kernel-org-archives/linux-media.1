Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278308;
	b=0w7S8ceMHT7PEIyCWDuIi1LAkSp7QneXli3fJmi+sbsgjiXfp0hCsXru5LTQZB8e5DRU
	 dhq9cYRYzvELFJMivk9duMWNez7XdTGgsqVeZw9v5FBDVW9q5H3Ga/aaI9s6n9cTfLBBz
	 NCADE1n/1qp+b2Q5dM4hnMZLcushw2mnzKRPaOx7qiu3TjzjdxliGsq4HFONXU8Cgtzef
	 pRQ1Aq8Q+TItzhe3MyrjnbrXfOveJ18oCkQLtMQDWh+fhGq05XyUmRA1LjSUwS7eBuc3g
	 AL6tiR0CMfGHwnOgMACkkQvWVyPWNJc18oOzOkyNCFTcLb+LiYuPVsOhdl8ZDGyxOBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
	b=YlTcNkuvZ2kknSzTdQa8J9rLhmYYK22zUKWUG7zJtujeBtv50yqHdxezjKqjj0lS91Jj
	 Yyi0vs0lRDCNK/Zq0G9gRF9PeKFuI9Sfa9V0CZN3fYvsnzGsYoqNcA2wLzaOJJ2YtKIN6
	 0em1kt7pL6Ku5bGspKOte6PzCX92QB30r3amPbsQibsympuxqjoyoXg5jJiRQR0PQ1omr
	 GaoaBUWiLOW+l7ZLCPIdI92t6dPos9l8AYnJpHaQwwKuIfuF9LfYf0/zjxG3B3QiICySO
	 YkxCuJp5hNRRduLEyjDgx686XxelGd6VxA3iSO9VyQFu764+V8GoSplu97KK3njmcjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3HKPdoW;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B557606A32A
	for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 16:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B557606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O3HKPdoW
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so22770675e9.1
        for <linux-media@vger.kernel.org>; Sat, 21 Nov 2026 08:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278306; x=1795883106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
        b=O3HKPdoWDNlPpa4GOqunHzCTOD1ZVBThTLWBXpFFL/kUd7IRONtBl1NCeGle3gaJe0
         TLrXKknF+bo3AhXUZ4MvCZWQHGhSjvSQb6qHzkXFHzfBjaXv6NVVwASnyw0ChS771Jkj
         UaaBZ0pdSI4rh4tpVo+Vmu078rUgFe72BGiF6u700rTFHEPZthcO2ITFQd65daXyjLsy
         NBY7BBGQTd04dJ6pJg36HFvEKRAJB/luGkzwuw8iiFsYf885AcgS7RotlUHRlQjgG4In
         WnABRBs+PU73ATkwerA2nS4QTxMLCCDAWPYKEJ22/tKKH3QocFpKPmbtYN+aXDFuf4Ud
         xtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278306; x=1795883106;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=36d9hExkEjPtvmQtsPosnEH+c8Q4VXKpCfV8tJSV/JA=;
        b=Uzj1ugWVbTtapIfluG0b2U/zWPM7JnEpPjfEEmt6We0w/g3eVQd2EeXoq3hpY2NrPH
         VROkp+8b/QQoSpTOXiZT8VWHmQf4xJXUwLZqfLfit2v/NtEpukIVp0TSn9k8cQa+T6V5
         GdoLQ5A0n/OKRmW1FvU7k0cJb6XOz72aNLhphWyYg5xQbOB320Ajn/Rjwr3zK4R2D7VR
         +Pws8vxALBq9DPWTwHqUd1Yxxbhv67KkGSRFYwOVsT1LCFst2B1KFt5j03DKf4w6m8SR
         c5YoE/x/f/JyF8YYTKfnV88kjTtuI+90Sh0rgtnhRmlMAcwmJqjWRBxQdbuZ2scNSeaD
         uDMw==
X-Forwarded-Encrypted: i=1; AL+hErGiq+IT+EUSypZr9lM9g8IG7wJu2Ox+oKAV8kXwRQOqwUkqBNEUD6jrgiyEOvhUqOuKBV4cFZVYuBbD+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tDD+XoxvZqT4PVtyTSwJQLZK8Ko2vyrYj7fmHFq2ovO6fGqac
	8CWK3UOnVSB515NTawYQF+koMStVgD+tzSeDLm1UfDH3uYBMl2sNeqsD
X-Gm-Gg: AZFdTZeO+KAUQtbVL/UbVHVpynTcFsunFnIQNX2v8n2uJ1dIk3NmU6ExpebdIm/KONt
	0Hcmi5GmRDweRygoMD9HlUoylzYJsivWrMRKissOVV+p3q+nnwWEC48ddRPUK2kmcFmELQkEIn7
	/GwqBUl0L7S7ThmQlZ0BhJrdPrGqlPRF9Xl3Bi+szqK2beH++WpRuDy7O1jMpZhs3CryuSo/rve
	5aNMczAH7du0Ziu0s67J/BYPOlD5r85g8W7TdWq+QDLFvl4VLgQs9JS2Sxfy1JTwsG9TUMXMCns
	VMA31n21WEhxZhEugzZ8vwyvP0SRoVCriV3YMrXiP7Xzed2FkxEEQD8SkhQIVN2o9BBS4oLHHVv
	KRGbyscNZO8Qv9Vnss6DEtcpbfWjTXBLyty4Eq32mJUO3AAicHzQt3w7yyUAB4L0I47Ih4Y5i2/
	LOSYdQFS+CJjddbCbiMNDwXr/x4VUsmG6MkPqcVvGdA+6TqGtS36gkY3q6z0acFSO0T/kt9qMtI
	ITM2KACt4EeqjkRQjLUTE7L7+I1FYZCoaI1m/Ds8JaSv+lYghjpE8t6ytKdL5jewf+oZDtXAx/1
	taCMo0z2lyeeL+RJ3JKfezZ4kMhnS37KoCuipdhjcXhWc6tA/I4UJCsqlnY0r3X9w6DhxPKG2rO
	XmyCsm3vlqCa5
X-Received: by 2002:a05:600c:5303:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb88807d7cmr140280015e9.9.1795278306276;
        Sat, 21 Nov 2026 08:25:06 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:2d5f:cf9a:376a:baf:495a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm67580365e9.3.2026.11.21.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:25:05 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
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
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v11 01/14] media: v4l2-core: Preserve existing subdevice nodes on rollback
Date: Sat, 21 Nov 2026 17:24:58 +0100
Message-ID: <20261121162458.1373638-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121135349.GE2472094@killaraus.ideasonboard.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com> <48240d57d86e78cce814822360c1b22cea80268b.1795267528.git.mauriziocasciano7@gmail.com> <20261121135349.GE2472094@killaraus.ideasonboard.com>
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

Hi Laurent,

> NAK.

Thanks for reviewing. The test only checked which nodes were removed.
On re-reading the error path, I saw that unregistering a new node can
invoke the subdevice release callback while the subdevice is still
registered. The test didn't cover that ordering.

Is that the issue you had in mind? If you see a different problem,
could you point me to the code path or assumption I missed?

With Best Regards,
Maurizio Casciano
