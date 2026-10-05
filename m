Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4F3F4841
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 08:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189407; cv=none; b=aANeI0JaBRmd5G45B1BmveX24TKkjloAp1o1wd6rGGV3Qn/Bb4hB/8ZBr/Q1aUXm5XE7o9xUQpSinGB/FrmsQtyAmMyOkhg6/W6yBB1hdDosHkQOv20IhvhVtHp62Hdrh7J4DHaiEUmWjhbQcB9xCcReFLEuNsYeMfMviMu9aHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189407; c=relaxed/simple;
	bh=xVWhoI1lNUOU6HwKrdL16M8Wcy17FpNv6JjlWtBiFHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d3eIeFnJd0B0L2h0olEbMxrXpCRFKTfUE8+RGlYb1H9gEpGXFNfPpkQTrb+kQTY7BVx042RuaiwyyEJ/HXPXTJR7qXdRJ2p72EnAYyNk/TykPsdz8kt3mHsyTorkHg4SS54ffvTEj7KSCd+r9UbWY3Q5IhEGDH7I6ZfKpGcVzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3Rn2Sw4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3Rn2Sw4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso13916085e9.1
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791189405; x=1791794205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WdBlTkVU5Ix+L6SuwkpBVt4AjcxSBhXQvwOG+kfCA84=;
        b=W3Rn2Sw4fmV+JEy9l/LRs2sdd2M0OqA85K9pcdruSRtQPUX24/Ozxpm8GgMKHXs33a
         NrlEVeJs/iUdXLZJ83eYePucLoiUh0Xxb0x9JRDqw8ZVD901Ysgx2/vLRjIFdaJaaKEk
         4HIgirjGIjg6apKmmRYHHrq+eu6F+9B8AMBX0U3Mh57Sr3DtMdZ6Mqm87iLV29IhYkb7
         aCG1mF+3RR6UFyMbcglHEdXvw0AArduKougLV4enqRdQQFX6fTCHzyZtr4YKxzpPaNjr
         ta8EkiHk4Glpj2pccjkqrsS72Hn4mxanb30SZeBmYoSpweZf1cljOlMhxZE5RlAZvICk
         7Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791189405; x=1791794205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WdBlTkVU5Ix+L6SuwkpBVt4AjcxSBhXQvwOG+kfCA84=;
        b=MjGXZNj3I6SoI4NI2XxTypRSTEC7AztpvYf6UpTal0+Z6aWopMs/e3bS4baLl45t1w
         TjPkD6dQbkDfXYlVG/N82w1ANTwrdYvGuomvdiG6BMQFUbDPOtUsDdLpXuban9MQM1eD
         wKqtuTu0j6z6SmwV2542zbMPdRnfKqZjIaQFXkwRNa+y6lskvEv18xQmrrp9TjrEhMGx
         dBKfoxEEVTcTyTywlT28ZbJDHbJEEs5fTHNqiZDIrDUsg4qPqXLjF21W3GZWlDC8jnai
         9plEPOXtNp899jW87YVZ6UyEiRIdCy4GC67La4VHFsz98DlmYr+UjGBJIlZ25gDhyFqs
         xauQ==
X-Gm-Message-State: AFuF++nyvMPY7QE1FyZhz1Tfg2LNef5knTJFxvVHEPeL5FkklhYQ1lNm
	rJ37EkuLyoisgAKHLGsajViBIM7efw5mq1XFuw5ojwDtmRukkIwxySFE
X-Gm-Gg: AYBFou3zIHWYpUrIMluV7qu7t5tuICp0p6ih1FayY+ItiFFZIR/DFwW1jLGNZ8KWhGj
	wg3XMdlgx/x/UGyhfird3M95MWS/OQpKbD86sH531QLGC9yZIrC0VOYPt4rc/7/MswK6buTy+pP
	fiBXr7zYHu83zrnavO/ifpNxx4zJpayVACL89eOQUQAP38FagJGXIXCHmq49zpyVCDJawLlnbrd
	CmGZfqKKqw2Vyw94m/oIarufRfBxwdKJrs/PZzeOIXKkbNwDzgbo7Fy2itumMPhOIzXKmaVDa4T
	7KtIRSdeoBP6egyuzEdIgy5CjWYrc9t1hzshgz9uqQAB9oy6pXMUynJGNfwgJGziDkvPcnpdmIA
	Zy3kmiWyZ4e4PBX2ChH0OWRx35MA10C0mrnt34tLuzuYCfjSyRPTlcTlH6Z2AZK/A5M4HV/ieRg
	u3aIuIrV+BBsC7es55AzZ6w09NWrEdcx2fIYbpTBJ0hw+PqNJnDRPDLhMCvdktCqi5CUt4z2HcG
	K9tiG3AA4Q4Z15t/vOrawGYUbOeoJa79emgK8YgiDWN4cDKBJFd4G+zgU3Go0B+kC4KsUz03l9P
	RawbJ+XwUOCtP/usBo5Bi7i5lw==
X-Received: by 2002:a05:600c:a010:b0:4a0:251f:a726 with SMTP id 5b1f17b1804b1-4a02759badbmr163677825e9.24.1791189404503;
        Mon, 05 Oct 2026 01:36:44 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a16620dbdfsm219210615e9.0.2026.10.05.01.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:36:43 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	conor.dooley@microchip.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: media: i2c: Add OmniVision OV32C4
Date: Mon,  5 Oct 2026 10:36:42 +0200
Message-ID: <20261005083642.11511-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asNbwhGCuxF6e6Ba@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-2-robertbozik@gmail.com> <asNbwhGCuxF6e6Ba@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 05, 2026 at 11:11:46AM +0300, Sakari Ailus wrote:
> On Mon, Oct 05, 2026 at 09:10:08AM +0200, Robert Bozik wrote:
> > +  reg:
> > +    maxItems: 1
> 
> minItems should be 2 here, for the always-on client.

Yes - will do in v5: two entries, the sensor and the always-on block,
with the example as reg = <0x36>, <0x3e>. The driver will take the
second address from reg on DT and keep the _CRS lookup for ACPI, and
fail probe when there is none, now that the binding requires it. I'll
drop Conor's ack since the binding changes.

I can compile the DT path but have no DT platform to run it on; the
ACPI path is what I can test.

Thanks,
Robert
