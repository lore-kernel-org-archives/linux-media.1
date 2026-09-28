Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792F3939A3
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600338; cv=none; b=f5JFnyrLgyFDThn55pFlx9q7jDV/0qVc9tMEdIxwVk+IZwmyl/HWVVr/OEjpkIVuJzHhFoNyzwNW7V+fcg4/jRrIo4hKYi5SYLX/UGjjPtxIR8wdYJmDkgyIRxI9jgIihbbPQSnB7BAF2rQv8uIiUcJ7oyESVQNtkxO8HejYx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600338; c=relaxed/simple;
	bh=MZr6wxL1uVtc1wSL0SfbWKw6lld4jX4MJAEXt6gdwH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYj415fBP+NwSDGs/c/+onChaQuZ59OG1QEOIhv16stHu9QZYHEf1hGY2kLRqb/y7n9oEEkkLtWshx640Mu5Qe46GI4CAG5ZkrlifcN7n2G5i97nz/0FJez8jjIlLL28otPAonfFpoceDNNiSaQcERec9fAjwbJyzmr08/Thbrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Wqn8ICPL; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Wqn8ICPL"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7fcb425fc2bso1870065a34.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 05:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790600335; x=1791205135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZr6wxL1uVtc1wSL0SfbWKw6lld4jX4MJAEXt6gdwH0=;
        b=Wqn8ICPLq7czB6IJHrFrFu8OpqoPozMtce2Qgg1GfawvaDp3s99HDrIPjotQISp/Iq
         N/kF4laEPf/FkKu31iibOJXhRPn88KgYgKvjlGk201xifZNlpTwOIvUq0NkaVAfHfd2Z
         x6OtqGZlcHnvppghKO0O1t4kGEoWjEcZK6nDPuioazCpQiptsUf7yH4bmfZ2XHIrNkP2
         6RVeTVkGPW5UrqYPidaB+/42mBrc+uw4Wo1yF6noWe/oPGad+NJua0cwA6HzZrwEy6Mf
         EFvc9w3IxvLPRhOl+f53nZ3iDExN3fyarYvNRQjsosgNk7x08TpCV5HvQ37ZNnlFDVOc
         +glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600335; x=1791205135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MZr6wxL1uVtc1wSL0SfbWKw6lld4jX4MJAEXt6gdwH0=;
        b=jjySn391537UDJoZA6CbsBh8+bxJRIFYcMPjInaZ3oYqDOBj2OcYNwqCdIFbfaHf7W
         SveJ0VN7yApu8sIhzqzX+eJbOyl7kspIYs9DiMjJ20QNmEcD4QgvVyTtNDT4vOhjFSgD
         OHlDz3S1xzTM3X2ZUV3PI6mgnb5FD+nSrjgtdR8tNyCgiHpmbB91oKmj7sjAsaM0BwAP
         NR/OqMftMb6ckS3INVmKfNim29q2mUrOIU4LEJGI2rBI2cSSM/RL72OY60XPp4x3rYJn
         hNWn8TV30xe0rZ7ayEhmN+G/Q1uX7q4PO9PgCXg4zKPA+lLad+pMOI/6hbQZMfCWcPSw
         IxzA==
X-Forwarded-Encrypted: i=1; AKwUvBzSQvq4OffNAugwD1E2NAHJQM16Uc8kcoZ0fK4Mqu/opAI7uJxxQK6adLnkjj7rfUQ+MLan3pLHB1eoHA==@vger.kernel.org
X-Gm-Message-State: AFuF++nlu5OoemnKZphul86zQByX3dZY4gK6KamPMsostV7gf9XqO0vq
	DmiRAxKyi3q2R0KhAHvLnGVrlXOuo0dxPVIYCCe1yGKZ7dF2f2Qu2H5O9gDQdUAPQJs=
X-Gm-Gg: AYBFou3Cs/hP5y3TjtJod/iw145e4SpjSECnbUNMezw1Wegc8F2hHhrzrmXRZz4D7BZ
	rAHEcYkvnipFW65xPHr/gSeFESb9N4b5iHexIudvKftbsyVgI8pSjnNkfp+uUXzVeNAOu+Gchlw
	nPTsekTfwXFCX5rZPjDVsi6Ya5e+Fpz31sQxXvg2ECelMd6az2rvrGIjEee1io6zZXcU3T9if5c
	hZfkFuuHRCzcYQ4RvkYSsuejEpikG26oAwc4vkDt+M2tp+mH8OfnJ4dnSeRlZTMLzinE6JFh0WV
	kAouE5p7eTxRT70TOogQNjG0w78n8obhRMKnVfVfgw8OTy/qEsuqxREUzyqbOOB8UdUYGSrtg6A
	5if1HRrfRo9W9HfrIL5N7QnOxvFLwIy3mzddMEuhn3GpQwVg0EBplvyfLMJ7wZNVfpVsZyYxU/8
	EAMW7BNornB6TDORRgoSCXcOFmHImDzzj1pqhxrVBAxOCq
X-Received: by 2002:a05:6820:8cb:b0:6b6:71f7:ecac with SMTP id 006d021491bc7-6d43f9956e2mr12191525eaf.32.1790600335156;
        Mon, 28 Sep 2026 05:58:55 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d87d9060cbsm4838117eaf.0.2026.09.28.05.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 05:58:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBAwX-00000006ltA-2Ds9;
	Mon, 28 Sep 2026 09:58:53 -0300
Date: Mon, 28 Sep 2026 09:58:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] udmabuf: respect the device's maximum segment size
Message-ID: <20260928125853.GG163130@ziepe.ca>
References: <20260926071258.77202-1-kmehltretter@gmail.com>
 <ea7da508-131e-4146-a737-5e8778866e03@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea7da508-131e-4146-a737-5e8778866e03@amd.com>

On Mon, Sep 28, 2026 at 10:27:32AM +0200, Christian König wrote:

> In general I think that the sg_alloc_table_from_pages_segment()
> approach is because of the broken design of the old DMA API.

The scatterlist and the DMA API use of it is very specialized to serve
the needs of the storage stack without performance cost. Segmentation
is intended to make the sgl entries map 1:1 to HW entries so the block
layer can schedule correctly.

Nothing else needs something like this but still has to tip toe around
these rules. It makes it more complicated to map and then in some
cases you have to undo it when programming HW :\

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
