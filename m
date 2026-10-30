Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368463;
	b=MpGSxIp3ZPsSUiCScD8RW8nhPMe+ilzdwx8towTnfrLTPORRQJS93nwSmCPe5VUYt4WA
	 /5P/YRKk5ii9PkOoKG39llOpZ3f7/wtUg2Wk6qKFEw23mPXdIyW3CGqPbDbtYkZZgXBNr
	 qhFCTlwnITUUYqUUNiSKJq/vk5WFn7Q3Dc1pi/yU+lOB0I65xzOtcUJFOs/mwL6yyRobZ
	 5vjszMfGib384YlH9HZSJ6zci1JDWV7A4B9HaO57Za4bjjR9CjvCe19wPbfRZQOP1mkv5
	 6EVMiNToT0873SKiQmRf1/x04+8N7frlRKGpQhMqdpdSMoVIfNKdIXSNRcg3J2Lqx0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
	b=W0Px3oNX2oqRF5JUsp6Jyz2a3ac8l3+1QUCL9gliibdNRCdQfikZba3bMcjrEpBSKAHa
	 DbfcG1r3cHynl898YkRdzdFMetgtBvq+E5Tqb7WElh3YhcOjIKkVcedSQV7XMCrqu8K6O
	 mhgGiAHGvs50UzdYn9n9bguMtaNZabxy8LoGC3TEm1iwnezCClZPEXSNkWwLFmRi3Js6y
	 ihq9rAQw1YlxVvLl00kKvRqkk/KzUbqn8WUMUZY3nJXg6oOlDWnej0mAjI+OHDiKCsfMO
	 hdp1nzEcvChJvFR3y55XdCiB24j2OHqF4DsOJIfvPcAQUSOMHhU9NhbWUjxBne+u58A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E1606A31D
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 13:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02E1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWaM6t2o
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so5961695e9.3
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 06:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368461; x=1793973261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=XWaM6t2olUZqZIxFriVejrYzehUyFljQN5E2CvGc2lNTgSVwJI5hIRBfuMBSzYJW1b
         573FOamRVec1VCMzletpzIxN7E3qGFoLJjVRSWtq0Lg78fbMdn2eGoHbT9tpuw9eKDkb
         hOI6+H/tt2KyetfMO7tK4BJUqLfd2n0gHAw6pZ2biqL5A1JuXRWsNqOeHLx+rByImhzv
         RSfl6WCRNYCVJIXSK6BE78UHY+WWI6kJS+Q6a9blv1tMTv+RJoO0dI7kE9Lcm5F7Frgm
         VeeaM21RYMDPzOqVzVtvdhncwp35WhxDJvWrR+HwCT+mVTFh8BL5Ke8mkmkbnyPnrd9h
         LJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368461; x=1793973261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hIuaSXC/8qKVAwXvaUJ1vLVQZIbwa7mDnRwYchKUok=;
        b=aL9Wl8UzibxwitcCnWOHqPHUbVZGr2sMzs0o0PVmF6rwS47VS0G6Y24jycKLrQq9yr
         NPpPCcR493ebKNDTnBiBMrkIt4dnKwMAzXkjs1ungy2fSsZ//ECmWOR0/MGmUK2jqEH0
         2/mzFKi1PJOBpwqDKa1Og1vtM5H4hpr46HjKJJctbTRY2fFexYv9KZtgPpcZKHtTGieH
         HPz07oissZAYl4t+xCE8iWWgnpX9VBtxt/ihSya9jPY/hJEgTDi0mH+dmghfj+y6gqYS
         l5uQsCRenDNVOPhKoDKx78S9eBlyBeR1RB6o7o/EQITrHIyGyPoywg/vIiDOtxYkacH2
         k6Og==
X-Forwarded-Encrypted: i=1; AKwUvByJzKaX7nBPG2nsJ9L/OMSXRfoQQnKHcEbR0iaZB4jvK2e7GKLBZGoH/PemolBaf8tZ6qN23pGK2QWmnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHjvT5TbszjsluRIMU5ICVNF/TQsVHiR49/Fk8wwWPbCGKuKb3
	h8GJKYSIJEmXBcNQlRy8THhjmreqiynUpicna6PviVFKsOVKIWt4X4sH
X-Gm-Gg: AYBFou1IfrrWAlys0eDNBeBvLBr27is1D/dMhrufjWYDmybM7hpqYu7D4ddvfx1Qgne
	2Q4BPv0n3VjcQMMKjPbeK/FohbR3uTVtx+MHyyr5aCO9XkFDLbVj1I8acq0+clLiTwaO2jz28qL
	JQrc6Beo9tNIGnHVX7kXkOBwRTWX1rGdVrFjQsh9S9OZ4oJqIkABUgYdCmzZ/KYNa8cH74Wq3Iq
	ruVkJEqhWKmi4wauRCdnyxUvNV48w0qTn6uARnmENZFleW47x8RocyC8COPG7SQ35miwA1627RP
	AKj8ML0jU0/ArZH3/u5QwAUJVn0Y/yrDCrtgCeIXvE9XfM/QQKzRlrHaSXmDsBOzw2Wg6R/evgB
	3v3sw35A5lpNd5pSDDwk2GnsR8s9D0q1OpkAi7JoiUdSg1xUdBnP/gn/vfE6nd8GsmM7r8VeZz9
	DSjPKLGKXZwsyMqHHxZIqgifEAw2rI57WVOB3BHTmPHdXKLwjHg7hSBo4T0LzplsTx42O9py9cU
	XliGTJ/6I0Y6KE11RNVzlCYMAa5LiYkK8Itvr2impEeCzqfIjeAeMqEMVlTAbwDOx3vRx4nbyPO
	TnqM8SaE+wKNLxaTvc8n3/Sr3RrQyTYf7N5eAquOgWbDo57euePnrNdi9vnM8llg3PzUrnuC+GV
	wguRiXStUoT55ucddKH6J8LVuOcbSO5NSAvPKDQZscJmtQV6ovH7dWOaqdolbSZpinuM=
X-Received: by 2002:a05:600c:608c:b0:4a1:6c0c:ab93 with SMTP id 5b1f17b1804b1-4ac190497bamr46672575e9.28.1793368460933;
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0950d533sm34613455e9.3.2026.10.30.06.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:54:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 16:54:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Frank.Li@oss.nxp.com,
	Frank Li <Frank.Li@nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Alex Elder <elder@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Guan-Yu Lin <guanyulin@google.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, netdev@vger.kernel.org,
	imx@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] PM: runtime: change stub pm_runtime_get_if_active()
 return 1 when !CONFIG_PM
Message-ID: <auShiOI6Hmla6XxR@stanley.mountain>
References: <20261029163044.3062958-1-Frank.Li@oss.nxp.com>
 <auRb_r8ZSSU-eHZA@kekkonen.localdomain>
 <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9207a52e-2d42-4e10-b777-2988e84d7dbe@ieee.org>

On Fri, Oct 30, 2026 at 08:46:07AM -0500, Alex Elder wrote:
> On 10/30/26 3:57 AM, Sakari Ailus wrote:
> > Hi Frank,
> > 
> > Thanks for the patch.
> > 
> > On Thu, Oct 29, 2026 at 12:30:37PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > > 
> > > When CONFIG_PM is not enabled, all devices runtime PM state should be
> > > treated as active.
> > > 
> > > __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> > > pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get().
> > > stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> > > should return the same value as the stub pm_runtime_get(), which is 1.
> > 
> > Shouldn't the same change be done to pm_runtime_get_if_in_use()? It's
> > otherwise the same, except that it requires also the use count to be
> > non-zero.
> I think "yes."
> 
> I think the logic for !CONFIG_PM should basically pretend runtime
> PM is enabled for all devices, and they're all ACTIVE and effectively
> in use.
> 
> That implies:
> - disable_depth == 0, so usage accounting would (if enabled) be done
> - runtime_status == RPM_ACTIVE (power is on, no delay)
> - usage_count > 0
> - runtime_error == 0
> - Maybe ignore_children is false?
> 
> This might not be complete (and could be wrong!).
> 

We could add this kind of information as a comment somewhere?

regards,
dan carpenter

