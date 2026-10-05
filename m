Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12740EB9D
	for <linux-media@vger.kernel.org>; Mon,  5 Oct 2026 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197214; cv=none; b=NXSu7g0eBXLX4YAS3aNf5rKZIh8mNyQymU8aFFl2o3FyY61D9vWaMVBeeIX/polRzjRzQjGz0kLCQgN2oz9KiPZrMXWp+EEfctlLb2m7YCJxoeMbc3XtLVoBWFtt1BlgVB0/3te0piAiVDnm48f7mdF74iSutpJJfaDpKOUcvAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197214; c=relaxed/simple;
	bh=mXUAahTE+iLm2mg6xrnFW6mcn2COXMs/9ARrZND1ezE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAaYUV9pzEiVKvusX54DFo6JWhpilOcX/ZrGfee5BdSH+KhN96sq4Uhp3qQswkYZ+2Wdjfun3TYUSJqoAWgGxNAPndddQbPEYDioF7TnxS3XFoeVtVD05I9WVYgUqW0C8fYMmFxu3tHYjUqyeyNxzQK0JSL7WQE3OM5YMz5o94Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oGisSSAj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oGisSSAj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso9509605e9.3
        for <linux-media@vger.kernel.org>; Mon, 05 Oct 2026 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791197210; x=1791802010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p87CL+99r2nufenKJUmxs5PgJ6qzjJ8ZoeapGb8jCEk=;
        b=oGisSSAjJcmo+bynapDG8BKlTVBWZZtFXgpwWfd7fYqQLPXUPueQnRY1k1ecl2+1mT
         PwN6u+e+lRIVQdrJP7+Q0mhqvky/n70m2i2nltczMgNTK6daN5VcARRhW5swXVTOMxBC
         eCI4PqZx6ImUIW4YRpWqKQYgvK7mC0QRvuuL63h7xTLakyLgR7EcK/7cd+DZ0hvTtenk
         bYJkVFPR+PfXis2zXk5SKOav1ZIHm9bIYCRagdEUYsivu7HCN7qwAM6FBl2ZQu6t7wl9
         t4xRicifCln9DfBiTg+oqfcXtd53j/K+jDdQZ0JjcT9xeuBBYEhkqJ5c7/LBTdg1m+wC
         ySSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791197210; x=1791802010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p87CL+99r2nufenKJUmxs5PgJ6qzjJ8ZoeapGb8jCEk=;
        b=WUbsO8CCRDw0aYTSwaD7JO/aiV9J+kVhUsnszIBvGWp5hCXhfJ2w+cQd3fx4Bk0G0R
         0qKXaUdcDMWNvy9vATHvvvke79ovoP17pMY7wdx0yPwhZAgDFVNMfS7Po7p3ImUwh5BK
         CRi9xdzgdJjIQmpA9bKiqUxNbrOtUDCQa9RQUTBmw44xVA2POEaUqTabIv3XT3jtfmrH
         1YzxXSHtBnh4kTOioe16/9tjZItDMM/kHjy+jLqi9cSfXiKEeowgEa6BmSE43YOBXh+3
         lmV9N6G8bmdwB1PKqu7pmTG1Ei7leMQe9lh1MSlEKmEW7XmTjhBlP1qcZm+4Q4CHWvIO
         sv+w==
X-Gm-Message-State: AFuF++lvnhwPTa+ysNQBXIuuCGuvver+kOeOFvf7yI2KUSJZYBhyKQe7
	ZCm44AMBvlQWdemQSf0Fn5XkR72/7Tw/MPqdC7iprw7jSX/7BNiFQnNb
X-Gm-Gg: AYBFou0V7/jDOlJZV8hDQpij0mlkGOFXQz8bIkjJnFsq6Hx8vkfwBwmBBBmEbYDA549
	jiLXTyiBAaD1fgPKpA/2dnpS7JepxfIHXV2oehSxbUIw7SWJHQlTzXmaTJAE5UGYV4ZWFhCV8aR
	dNfCHjPNWUi4PSHhEnaoJSWBRCI9D7kVFildVFXuYjEod1zlHf+hB7DKNyY4f1gg1R+gHi7Fhke
	XvTfnUXUkjfumdUu2O2wzxQesOFfsVLJGZYJv0ffE/8knmfsJpZgX4ciodgUi8d1mfZuqxbT27Q
	CWWzSQg+fOD8iAiXxuXhihOoKk/o3za2R4+1XU0/xMP7H9x2+0hEdlFilGuki7Rth1aSJhneiLc
	iCBx80/OE0qfu7JqTGqgMio/G9QWiteRh6n5Mi8v/SVhUIDoHrSCe1EWPLtIwKMAvvVGcRUXEyh
	mhj9rGZ8xzQ/+XHNJVEUeiWr/+MIOP4prsb9ka5p6Gt92pCwua+KsdH/MuwHt70xNeNbv5azSnk
	r/09Aed92HRblw2wO1mBio8TJvlxd7F/leI5CfbEpHhDFVSNeoq6jhrRyrZTbGb/d0iSAL9YpJF
	/aDycfQWMnfzm2hN5JKymG9eJQ==
X-Received: by 2002:a05:600c:1f93:b0:4a0:1c10:1419 with SMTP id 5b1f17b1804b1-4a1728f7420mr34459605e9.26.1791197210463;
        Mon, 05 Oct 2026 03:46:50 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm367261625e9.11.2026.10.05.03.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:46:49 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	antti.laakso@linux.intel.com
Subject: Re: [PATCH v4 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Mon,  5 Oct 2026 12:46:48 +0200
Message-ID: <20261005104648.16362-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <asN9kKdqf6hY_iCV@kekkonen.localdomain>
References: <20261005071010.7191-1-robertbozik@gmail.com> <20261005071010.7191-3-robertbozik@gmail.com> <asNsiKal6GgcqUSK@kekkonen.localdomain> <20261005101447.15264-1-robertbozik@gmail.com> <asN9kKdqf6hY_iCV@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 05, 2026 at 01:36:00PM +0300, Sakari Ailus wrote:
> > Agreed, that is better. For v5 I'd give ipu-bridge a small table of
> > sensors whose second I2C address belongs to the sensor itself,
> > { "OVTI32C4", 0x3e }; for a sensor in it the bridge adds reg = <main,
> > aon> to the sensor's software node and does not instantiate the VCM
> > from SSDB - so the no-VCM exception of patch 3 folds into the same
> > table. The driver reads reg with device_property_read_u32_array() on
> > both DT and ACPI and the _CRS walk goes away with its CONFIG_ACPI
> > guard. The property fits into the existing dev_properties slot that
> > lens-focus uses when there is a VCM, so no change to the header.
> 
> You shouldn't assume there won't be a VCM; please do add an array entry for
> reg instead.

OK - a separate entry for reg, independent of the VCM.

For the VCM I won't assume either way then. The bridge instantiates it
from the second I2C resource of _CRS, so v5 skips it only when that
resource's address is the sensor's AON address from the table, as it
is on this machine; a module with a real VCM there is handled as
before.

Thanks,
Robert
