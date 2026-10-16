Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCEE3E763E
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146434; cv=none; b=ociNrkFrC9FnInyccldAiJdlMElz0tnpVOGPMMeBE+HK1DYMrvc/hxU0Zf9FYmW+4+42ZnfxstDdLq4p6pxZl42owOyUc9AH8b2gbJb8D/zjTlFslyCrugBKV6jLoFBCRtQuDzgwRgXGZmGsnQp5Ca9WGSLteAPACOIRCm3Oxvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146434; c=relaxed/simple;
	bh=Ax5VOQA/Fi0laL2ZD1hrhTqB/HB9VBcr4363vS0YCZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Od1kGcCs5osXfWnVv/BzxDukBJR0eVSu1SQlJfzi/Mafa+NpHW+9Du+DnpYH/UiHMh8lnQBXTD5i9E9OC6eYzYJAv2tjQgppuLXuCKnU8HC85wiXEJ4d0WOtUsCa/2IBFnDBCEosOtYO1PFQ2L9Qw7B2hQESpzvCpxKWCBjnYsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa1JMdD2; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa1JMdD2"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b0584ad71so3740957f8f.0
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792146431; x=1792751231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UyhIdDi1VpYOEm/5a5yHitWOCTd5K8IUtK2pMbtEUUc=;
        b=Sa1JMdD2igl/XmKM1t8uBzLcDObQGTu3VWICw1RgSo7iLPUDNSLYILQElotAjCCAXl
         MtSHXiF9n2QUrn9I2qBmz3RZqrS7nRPrYHWoQM/dJPJTMYKN7tAc8jpJLOQvSnQRlsMJ
         2QhlCyrd1AtUvYJihFp3GJGgs07nYdmiZN3zX4aw57G9s6Z48l5hRbnY6yaysMl9gaMa
         83HiJEKCD8Rc6k60+kt47+Ws/B2dENC9nkTPUlqaB2fBLCwr5Pv5TREG6tbhngv1aEla
         WmOWQA7XZ99hb5+jUwd1wOR90qyYPFbzBzjEnAC0+pbhRy4pNkOMwF1LMbBMheud6FmG
         m6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146431; x=1792751231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UyhIdDi1VpYOEm/5a5yHitWOCTd5K8IUtK2pMbtEUUc=;
        b=Z/inSxhJFnwULXl+cCwRSArDYbCXlxygR4FjFJ5rUJz/C2+2pPRsw2v2G5hmO8jHQV
         UBEbsGxnpHffyzmLsDxqo+jMwVe0cIcnH87RU78szyoxLTwLpUvd2iZRE67KfhOvhkTc
         t1pDgdo8+wB8Zcam/g3MrLq5VdYsUgzAOY0QAgP24Rx4PQsyPSVtLE5/PZ83WqmLhEpe
         XdRm/EinaFcVxr2b7BZsmFr8bQhzhPMGGzT9Mfi1ttxQe09CFeIAV0epMzmmK1db1dRq
         ax88cLchUx2/8EoG1DOBVBA7tstN63HfoaNp6m/NFW40VgTvqONVqFcJUs6NDQCYSBNM
         moLw==
X-Forwarded-Encrypted: i=1; AKwUvBzE/IMlkGRpr7a9juFGFsAUnwvkOpRkFCyEN5VZAJ5cOna/mVvKOXIFdWO0Uw+qoVEY2KTVnG6BQGU95A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdpKDimCeNszjTRcy9/8lzK3Gh3pSaJteR4hHUXijFufXYl65g
	k9TbOkWMhCIxYMSKLYRIEnc+4jdx89aYkwZKFRaTppnkWh86MDp0sWnw
X-Gm-Gg: AYBFou099zyX7vRgvZvi8ni9mVTmKbbaeHgimoJP+sodXLB8AvxWAJCYAQu4MFuWE0R
	JSKD/W31hAJq1sFAinKfJgvpLROLH0QV/S6ZlT9CcQ6XOvKUA/JMs2ViUrcHuJsqqS4rSXEmvN1
	N0FsNLq9LnzUZRaHztpxRgKvbtlNnXYPjbdstam9ZkEBUX+gOr4iW3EHwU/duZZt8Wbx5xiqiMi
	4KkigIcbRMp+9PF/2W451ifMGE1+n5obaFmnirTZXWtP8gjmVPcaWR+zSEyMT1tdDtbGA1cOQq/
	70GuIIoU3WoLSLs+i7Za6VFDlFjUodeZhb9dp2P3GfyNKo8k5SdVthKl9wCOh8AW3ex0/iGo4Jg
	6PXml/grvGeKngZ7chl9nP9ruCHUk+Bv5bd0MDqzhli/AE+jehFRIh/Ug6HsK9N3Z4mhEiWEVZC
	cKutcxcKISxbYyMgDq35ZZobGt1sOS4JBvH1ev7fnjNcJ7SPxs20xF61/geDtCyJm1BtDL4Wx2m
	gcK598f0QSVncyBEOe4JqSOhYU133VFgJ1h7TN+w/xFfwOvMFaRpIUH3XcYVFi2a7gFmAJ8
X-Received: by 2002:a05:6000:26c7:b0:48d:ff06:c634 with SMTP id ffacd0b85a97d-48dff06c78emr2653168f8f.54.1792146431162;
        Fri, 16 Oct 2026 03:27:11 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm3698139f8f.15.2026.10.16.03.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:27:10 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Peter Marshall <pm@petermarshall.ca>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jizhou Tong <fqwqf@fqwqf.xyz>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: fix VD55G0 streaming below 900 Mbps
Date: Fri, 16 Oct 2026 11:27:09 +0100
Message-ID: <20261016102709.30467-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016070158.43624-1-lsa.uz@pm.me>
References: <20261016-vd55g0-sp11-fix-v1-1-eb14bd80d8f8@gmail.com> <20261016070158.43624-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 08:02, Sergey Lebedev wrote:
> So here, writing 0 there does not stop the output by itself. vd55g1
> writes it at every stream start instead, which may be the difference.

Thanks, you are right, and it is not the place either. I retested on the
Snapdragon model with the line length change applied and 0x0329 handled
three ways:

  ISL_ENABLE = 0 at every stream start (as in Peter's v2)   6/6 captures
  ISL_ENABLE = 0 once per power-on, after boot              2/2
  never written                                              2/2

All at 840 Mbps on one lane, 644x604 Y10, with real images in every run,
including a stream-start write on the first capture after loading the
module. 0x0329 reads 0x01 after power-on here too and 0x00 once
written.

The failure I based the ISL change on came from a debug build where the
line length was forced by a register write just before stream start
rather than coming from the driver, so it was not a clean test. I will
send a v2 with only the line length change.

Thanks,
George
