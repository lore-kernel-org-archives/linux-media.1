Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6378D44839F
	for <linux-media@vger.kernel.org>; Fri,  2 Oct 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931102; cv=none; b=O8/21yc1Vawje8LoVw9Yc6um5drp2r2VK/0AnHVWXr0d+QlZ8u3lOxmSoLn02cMP/VA8zd99f6cLAEFY8ZTLzChk8WGsVSdKoiUNr4pJ6Fz0ZlQVCd5vRxIJhFUbnGzsyIRZxVRNJ9TQ2OoDbWka384wNTMjcWzYunWHFb9RQCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931102; c=relaxed/simple;
	bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBZ9AEs+oj2goFKzwwF3UVVz7n0+YqvEo/dSqI8vWwiNt0ZR5MDPIMVFhNAXa8UIKwNQVOMizadWToz55RD8a+nFJQm6u8OvD/+IoLlGDTx1cDIwlVS+NP9t7gXI8NeNZ5Fod+SnEkGsgK8UQqUmorm9u8TiLtw1OBt3KhS7DOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLbxvdm7; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLbxvdm7"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b059eae96so1677242f8f.0
        for <linux-media@vger.kernel.org>; Fri, 02 Oct 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790931098; x=1791535898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
        b=sLbxvdm7KYpH6p14ar5HwMNE0jHQlB6E4xp3QidaU5IBkcLYPA4PavDFKQxaIF1R9A
         TAPGLMh0KJ2lV7lS5Pja7cBzhl6KjHuqOUCWlLtx6pVBG9iGe0gFEjuExAH+8DhL7QLg
         5HRYuljlLREXSTHmDVcmMyLRYOmYnacexy3kdENtWW2X/mGEhNUH9aOBJYxm2V7VPgwS
         zTq9zjInXJsfxJbacmvMtgdSUnKcMbCMlAe7VShYNzY9g+3UeaWKWE2zc0nd+yaB0mmi
         mFuqUcvBtXDG4zvbUfju5C75+wby58p5fUUDW+vk80c6HmINT2HYJ9FrnMTbiunW9KQj
         PTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931098; x=1791535898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm/X9EW1BssQMdacZe2HgeoRuFblXb6/mQSRUp0Gmtc=;
        b=V7/HZEUgBax5JOVQuzreedsUJ7BWQIX7HBg4Hpp5J9EmGuSVyCQ4+o2M6Jb41jGthM
         oNEK+khn1+xiTJ3kSNDJ9bDdLkWZrXM0Tp+V7ZPJY4h/1M4qx2ILj7OnIO+NOyOvmnon
         P4mU7r+MNj/wQ/LQF2T+devzv666xtD/KbgBsn4ELDCMwT9hTqk9y3EfU4EksM9JXAVk
         ci6euhq4xnWFIxLRxg+wLC9q4nSyS/ZUNeva5xAC0s5ZS6rmeLrHAk55QS7cKbL3DkVA
         nwyPKxExGoKiQVj9t7lUBWJn7sVT6JWesjzPwGrLHfeCKtuBuwhar/VuAwM4yiRSjBZG
         ATYw==
X-Forwarded-Encrypted: i=1; AKwUvBwytCw9WgPAhZXBn70lsXuhyvbXsIRvf3pIAFeEzHJSA08HYJOjpzA0sDQiuE4aasLcbpJdidjtE4NJJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKOZxeeAfu5je4SYVULqFWpPqBn5BshnxY0lr64SVlznc/TExle
	NE9CrsxoxXBfPlJBy0Jmnau5G0e7VLss1cEo47Dd0TEJLh/v07o/h3OJ
X-Gm-Gg: AYBFou1cx2impYd8Pyw+g6MiqoWaGE47oPa8hbXQdTrFSC2UefiaYbQz3RLF5751Iio
	mqG6elzxS+ATeaPhepx2G5BWyM//ocpqd0eSGfIDcQgxGr93gLa38TYz57IdOpCrrvmDXA0+6Vs
	22XjY+S1mp1IioHEZnZJLiB/PLrHgnoYgO6uuLw5bNpZ2NvQFjATFj25MZvUIoT+/7AJ1ZqnktQ
	4/kM0+grUUq+pVy2pYLm0uzLIXQw67iXR66I0iOD1gHm1omhzHcpUXj+AJW77gIpld3zRchZOP/
	wzNh724BLnjCqLSw5jTGGhKMqZ//R2oOM1+7tbuuGHLnhT3JVZZwVvXwF6ufPi9v2zf4BtDZ3UV
	7nKZ8UtnBhMH9dhMWwlqxsGQwLqAkeC3P/55AeZYar+RVN0WwoxGD1HY17aCgIX7NaQjjuOO1HH
	NzsT7ZrYp/hf9zniguifsLO5wumXNC+DFv1Wriw6ORjDPnLdh+qI7U4U/JCiq0lkfvfIc=
X-Received: by 2002:a05:6000:469a:b0:48a:fd90:f254 with SMTP id ffacd0b85a97d-48b1272a07amr1928001f8f.28.1790931098356;
        Fri, 02 Oct 2026 01:51:38 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fab11sm4165684f8f.16.2026.10.02.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:51:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:51:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 00/15] media: Add Lenovo Yoga Book camera support
Message-ID: <ar9wlk34f_aNlIyz@stanley.mountain>
References: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO7O_xjhrLNFu6sKEFWp8z+UCkcHu9kr9KfxtEQ=T9yKHCQT-w@mail.gmail.com>

Please, wait a day between resends...

regards,
dan carpenter

