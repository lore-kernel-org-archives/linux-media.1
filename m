Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795D39060A
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431124; cv=pass; b=ctS0klQ/T8+ls2Fo+w/gmMA6YHCxaJ4/ABw70sV17N0fHsnOMh9w9HR0IYTI15ldG5OVkpoT5U4ljjXBB06tnWYbSR32asIiBhUS2o6LRWQSk/he7uDCHNzsTxk/JBHEKN9qD319GCt5TVomeC51lqHc7AZ6lefrZC0EuA0HWPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431124; c=relaxed/simple;
	bh=ox3i1yXxhIWvPnvatjzCX2KMn+Ml1QkpyvQeS77X2Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2krCPVakTYvxsJqSmoDHqofL7apJq+NNgJEWr07g7fZ6haUhUD+v7wQ4ef5HqrM/+LOWOa3TipbxWZYaSxc3G7t5rmIL187r5zX+M2iGAY0WrwR/DOE4q24rxr4exVj/D6aVsBreP7og8/f17arH0gWGQ4pVLzFinQmvR4lk9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=dHASFzjP; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="dHASFzjP"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hbG1q03hGz49Pv9;
	Thu, 03 Sep 2026 13:25:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1788431103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGwfpBxUBvDO+KJa6P/MbPSZzDq8GB2Xs/HFD5tyqCc=;
	b=dHASFzjP7PdTu8r0/akm/flIwUA+3CTmgS2/IHezRQ15zKTPRUq3CJaIhD4XJiJz1Mopgi
	MzGDX/cZtqgvjKOGP0iJbTarH8DkkAUFK2TpY+OmvMSYYLs+8Vwn+dYSwppk51TCbAEAMH
	keisJVCHUVtfoAr5cM5R+gwXr9oxcuS/3pqar/xkIKf69GDgCrhtREKXwotNJKOitT2kFP
	qxV9XzB/RzuzkDdpCh9hRQ/J8Fqg0RcITUHZltFBQmP8AOJHHgWJ1nvQu9RnN8v29cNciw
	fP3cwKcodqU6CRL9bmzrg8h/hG935Z6Fpp6Q+n+Az+PVkPObrrLv5rQNpUKLzg==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1788431103;
	b=pWo0gObAk++z+gzpG0bxy1yqtlg6bPG6/uByV+8MpeDJAtlqCK53RSkn/d0LAueZBRPqF2
	3J6np0enNFcceufCCdmxGIeGwPCoyWMdW8XE0etaYmxK3H8xC9xy6JK023aia0deeK444r
	yDUqrdKLcwVmtmSZBa5ktYn82GN3K1djvfgy8fC+9rWzyy9Q22AE5db5gzZu//wx3W4idQ
	Mf2prmZR5iHOtJsK8tbdWSGX7f7P4dDz5p9IF/WMWaisqCDM/an8f1hNR2BTZ9z/1Z7nlt
	QcT/Zs+9zylxUUaS36if831KkWzo7t01TKzi4no9RCVBZw0b9+UXfcombAQ0gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1788431103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGwfpBxUBvDO+KJa6P/MbPSZzDq8GB2Xs/HFD5tyqCc=;
	b=KWMQxP89O9xBKc9mAEp3gZ8Fic9OCFIJeNflAb5RnoilP64uG1i+q2k2YhGu7FQIs2zwap
	D2IOVso6K0huCzMfYdVLkoEe6a1kGZrql00NJTv6PFV8SIRdZ2CGus7RCtF016tswhUiLQ
	E8I3CD9x94kxXSTeN9YnixUspgPnXEEFokSGmdzuwdaohnZtLTuUusA/jj6TZqM42u6Keo
	mJks5Bbqt3bZOpEC+ok0AaPazuDgp1KWnIGDC3nomZh6QFDQlDFpvY8wqEaWMI+cr2eg1E
	1n/OzFvRPYlHKg56J71Or/htCw6Tf/IaYUmIS1mPes5dcIqFLmNcRpJpiesddA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 12D5D634C58;
	Thu, 03 Sep 2026 13:25:02 +0300 (EEST)
Date: Thu, 3 Sep 2026 13:25:01 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Antti Laakso <antti.laakso@linux.intel.com>, mchehab@kernel.org,
	sarang.sapre@intel.com, daxing.li@intel.com, ong.hock.yu@intel.com
Subject: Re: [PATCH v2 1/1] media: ipu6: Add a Kconfig option for IPU 7, 7.5
 support
Message-ID: <aplK_YMgVfqhf-4H@valkosipuli.retiisi.eu>
References: <ricardo@ribalda.com>
 <20260903081614.1841716-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903081614.1841716-1-sakari.ailus@linux.intel.com>

On Thu, Sep 03, 2026 at 11:16:14AM +0300, Sakari Ailus wrote:
> Add a Kconfig option for IPU 7 and IPU 7.5 support in the IPU 6 driver.
> Enabling this option adds the IPU 7 and IPU 7.5 PCI IDs to the IPU 6
> driver and disables the IPU 7 staging driver.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

I itend to squash this to the last patch in Antti's ipu7/7.5 support set,
with the following commit message:

    media: ipu6: Enable support for IPU 7 and IPU 7.5
    
    Enable support for Intel IPU 7 and IPU 7.5, found in Lunar lake and
    Panther lake, respectively.
    
    Add a Kconfig option for IPU 7 and IPU 7.5 support in the IPU 6 driver.
    Enabling this option adds the IPU 7 and IPU 7.5 PCI IDs to the IPU 6
    driver and disables the IPU 7 staging driver.
    
    Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
    [Sakari Ailus: Add Kconfig option and #ifdefs.]
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Sakari Ailus
