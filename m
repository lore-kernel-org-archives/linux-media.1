Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370398;
	b=3CWDwMapFqnhGNSkuJcZQhhic9K3cP/6XjURZU5UkGKCmF5u/WOu53wPG2zVMl189IEF
	 cJW3a5gIE3ADcqbJB0dp2V3CwmgKsgA9ERJgM4RBf2l9FCbw95AgyUKYdExr4q4PWOoMJ
	 hRl3FnVKEUteIE4f3Y0E1LIH+sEAp/QtLH0egpP3Z5EXk2gbd+LkLCa57zBFo+dSii0+m
	 BDYaPJapcj3erHnJbgn80oTHQOZT3Oh7BScXiZ3/o+vq6yft7Btt/c8jnn3+RKL43Dwp6
	 IWRCaE4znVQqVyJ7A7C5r+aLQ9TOGYE1+XxxwjCLEZUrP1IudvBwjgoJti/O5UJGAdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ngz/8e+OQ+7PO1cUE4Bn8qwAMjSe7McwIae/yVzjt0k=;
	b=dOm0EIXxLIq7hh1cFKAnBgZsZfpVd4mvl+jPnqcY0x0BE/AEtElJLS4EPVF5Hao71iGI
	 eO8heAjlGOLs/gJx0nOIvB/WbFoIQS64gMkIL/qzK2Ss9VvbNfxNCfaKOkyBHkrNPzHcc
	 yAbUYWFLSu6581MlkW95862YBldH2PXPNLiwX83hzLrPTXdO0uPTMG62cFpZp4TGrqgZw
	 LsLLa7EpfKAKGEgLfY7FuKW0rU8IkHezrpF60UfEHfxNDO0fwpLd7mr6sydFkWYnYkDBf
	 fb76AXMVa6vpuvDUQ7FQcFK756qK0p2fjwFOGjiQGUqZbPXPvbjRYZDwctM3VEsLD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S4f/L9YV";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB7606A322
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 14:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7CB7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4f/L9YV
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a1c464349so111728eec.3
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370397; x=1793975197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ngz/8e+OQ+7PO1cUE4Bn8qwAMjSe7McwIae/yVzjt0k=;
        b=S4f/L9YVktHwmAwIr5aqb70xLIxHish5uLqzxeQVEKNS38/CzOVWjKEnkkgxe59315
         o43RGGLK4DaWQRYJo2UUGpWGyMJccdix+xKWqp382rW+OtSCYjvPiTAeH48AQKcB9PId
         Aaupfkco8mDnKsK4UD+lCKoGBa+aWHKDp2azVmGcsVspoRDdIAbJEJlwPqSOw+nVb6hv
         RFt0OnWsSr1ZyvG3JAiynRdwVvfreAS1HgPpUAIXTx+zbLpYfLcsEIrdUNVrXy2MreB4
         KqqhMtjhJaOK/9W39sSu5XQ5KEbY42ZfvQe3UX4TTbdYnZSmSbx32P1YCzKYuQN5INBC
         1bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370397; x=1793975197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ngz/8e+OQ+7PO1cUE4Bn8qwAMjSe7McwIae/yVzjt0k=;
        b=D9k1MkxidR58ooYNYO1Wb76AyaExLMb0+/3Nw487TNgEEKW5UebjpB8NvN23NPI4Y8
         C881b7GpChl4NxlrJZE0T8zo7wDm0Lxo3UHvXPJS/iUA7yoEfGIR73OGhy/oNbgWfE/t
         Xq1bjNR04thx/IIG2Fy104Ej+fJxCrmGlhLAPt+WHQRJZyXxw9LzWrztLlo39BNdIJv2
         H9QnAFvLyziCUlHKBxTL2WVuDyYxxxC/rJmnQcrvQFfRhPWsKq6bgm2iFhgnfPk3i2m3
         7mxZjxk4JTP4ogH2dPHOnZuFpqeT4oIj9OpyW363BspQCcVbvnRVQUx4uIrN8TXONP6h
         PLTw==
X-Gm-Message-State: AFq9FYJZ/j7sOoSqJt67FGepWpa1DfRw91G3HhbSooIe/kKART2LhlPK
	rDRlb/mAWC+BFMzsiKFOEswrulokCDXmZbHpxptTrY4BlifT2BuZ+hAn
X-Gm-Gg: AYBFou1RGUSGzLUSPYOOyXV08F24PNUmjqIZg+9EuWJN6BTlldkhw9DfySMGI2L6ObN
	5OTfyVE6aUalr/NT5BcNWZhT8jQ1zYnWbzaVzlXT5GUH+B7II97G/4uOUvPfgtMnNnlhwE3FnSP
	fuH0VmLr0om4laphPxG6DoMhHqtjxHjTz8is7xAjStqZAtq4F6XuM2JAR5plUTWTFoyW9HdEZmj
	TUphlzDH0r52k/PGApNaZPUQgGYrCe6aqEUxGwgEC3N6Sj47LwVIkEhgKAxtVGsBEb593AzhYu2
	49cSpJCBki2SwK7ow+ntWORYBx6Z+MDv64iNpK8Yrsq+Hvgwpu9AwbZMJPGwLuaVHZdSaTN1zAc
	/6NfQ11QFZ9bzyL8qRQYsSpEFAttK/vVW5+M28KwcHCuibKOsqVfqB0b801hGQTUHN/adDsayyo
	J8kj8yD0ZJphky2DgxbC08qaaL/jAzeZxqwW6zSyFcUNNccIvEpY35UNn70sQmAm6Okvr3LLj2B
	rLWTHrPx4XQUdix+XVUtbE1Y2C1C8hpuLp154UYBXCPLMzkoJ3/sZc2vHh80AQayHiIhdV85asG
	vKbiOFJ4OqmEzjzGxuAFrrrhpyhNx/34w+vx4DC1OkP4qfWE1OW7t2rkCuM3MhAZtfqlkYVm7p6
	dETfv+hgmeciE8uGCHDtHFbL+534WKAe5mtSaxo4EL3Grnjy3hQLetqmBzWwKPE3XQybsakyWGp
	lMVFLUmQmDfXVq8ktBdV4=
X-Received: by 2002:a05:7300:e9d7:10b0:36a:1452:8da9 with SMTP id 5a478bee46e88-36a4231f759mr6123244eec.1.1793370396659;
        Fri, 30 Oct 2026 07:26:36 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm7330764eec.17.2026.10.30.07.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:26:35 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] media: i2c: ov7251: Move the strobe registers out of the mode tables
Date: Fri, 30 Oct 2026 23:26:33 +0900
Message-ID: <20261030142633.2235231-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAPY8ntAzJ=jA-c9LoLW5tQS=bpQZ3SfepcGVuvhq4cRzXvRK=A@mail.gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com> <20261026111032.88355-6-antoine.pichot@gmail.com> <CAPY8ntAzJ=jA-c9LoLW5tQS=bpQZ3SfepcGVuvhq4cRzXvRK=A@mail.gmail.com>
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

Hi Dave,

On Thu, Oct 29, 2026 at 04:17:29PM +0000, Dave Stevenson wrote:
> Is there a real need to add a new array of registers for these, or can
> they be added to ov7251_global_init_setting? As long as it's after the
> {0x0103, 0x01} reset, then order shouldn't matter.

No need. v3 drops this patch and takes your "Move the common registers
into the global init table" in its place, under your authorship, so
the strobe registers go into ov7251_global_init_setting with the rest,
and the strobe control patch only names the three it writes. Details
on the v2 1/9 thread, where you posted the branch.

Thanks,
Antoine
