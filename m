Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448398;
	b=tgSTog5VfUWLFRO5XDRnJJOrko98oIB8E7s+hfJH4N6OT5rybT35z1cnambDZq4ZDvrN
	 Z3nr4m+tyQtUxeMCdlv7l4ldmhML3DseX9zIz2XVy+sGI+R/awzzu/RzbDTULSFqzELKU
	 5ptw2wPOr57piBL+WixHPhJxjjBGK3Cu6g96IQhWa5ex5ey53id8FjKc7eERrqCbyiaJm
	 JEz1ZScvkDzLAH3fx/on11ybSrAymwr+9tkVoEiB76DJ45wlccPGntuddyCin+/4i7hkq
	 xbYHeFe5OIRbahMtMWtEj7ax/pzyWGi0nbkN/g7i23zLjBDuoHOw4IJyYxIH1WVEEwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1GFxZl4y484OqU2tYpxeVAzeWG8inzouoinZygUizxk=;
	b=cPDFwdsbWCJG74QHS789HWScZlHP4jhFbkHzgpmt+hnfNXX4a7qpk3Ae5yadVV3FQFax
	 TI+SEkQ+ah5XTM9PVxtXrfu2rYOK/0bOO7AZu+LbVib9FPAGBuvgMteILvBJaiUUyw5H2
	 uF5F0QIDeYUlqJKZnLA1ERV3AaBUSb+bRggL1SiYp+6ekREEWFNlLEkgBdEDItPBhOMSh
	 HagFQCmQApiRa2gum7ee2Hg9Su4mx4zP3CkcinaFwy3LUy7IeNvBm6QwsRvoowWSZVjT9
	 VYiMG5mbzuiSTVDM4Qm+Q1z+x1ZGGIGbttJKYfTsxQVKKGVFurIdwaBITV4BA9nk9jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iM529hfW;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47395606A69F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 15:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47395606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iM529hfW
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b546061d58so7608429c88.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 07:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448397; x=1796053197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GFxZl4y484OqU2tYpxeVAzeWG8inzouoinZygUizxk=;
        b=iM529hfWQ+n94eebPbIoplRbcrnJHE4vvXXd0I8VP1GY6h17sc42vj54pbR1neSnqj
         7CFdh0nJmR2V+6geapTCnOfymuO8B6lj++4aaL68o6LUIf66cZtKUNZOtQ9cmray/7Sa
         rgcJk38ZLsEPfQJGI2/wNaeAerZaXhU8Ar/Y9jOh6DzPdRtU70cI8qtccUxr4fylnicZ
         Vzz4Brqkj7oxkJOhjTIRO86XMdoFM6NBQ1i9MXJOUIcpbIe2QnNB8Z4b27jB42wxBTnd
         FjBkcBlWzuwhToVqjJdcjaDal0UiugtXDwgM5al4U25boOgF4F7wazDFV7AavZa25ooY
         kWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448397; x=1796053197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GFxZl4y484OqU2tYpxeVAzeWG8inzouoinZygUizxk=;
        b=Q1uwat4WMEdB6pf/UNfkBDVgDjQh9WpsL+DC4jI8U1LnIXeXBbdva/mwhW+/Lh19U0
         edI9nnKq4WzIp0xfC5zZOnLSg4KL1tSL96MidoOrfHOfTisBCVLv6uOmgx0H02yOHsBu
         gnJv8IAgOZeEU9PYMUQKpj7EGhlQDZKocwsOJ8OythRX1YbtJ/MB8FOxO21Jr+w9uEi5
         ZJ/lRFtaFXxvwuFjzH7cQgcuVY15SoPCNNFcSpHOoyH36j3rwooSGNuGb83wW5pWTIZZ
         5MwN2AVhbdfadCgeuW0wNLHEcrmfUvWlKWwaMmC0/k+N/T4tEglpOh0p0TFYtgRNvdql
         WkxQ==
X-Gm-Message-State: APuU4Z9YiD7pphbq9M6e7JERlMuFHEizsNcuxAkceH0TRWbkLmjgaVLv
	gsAuPJcE9+floyAGbLqfrmeveelhReR4mKAKEhsH3KqhaXDpYvy71jrn
X-Gm-Gg: AZFdTZcXcQcZONMvgpWecbCecw2vwhgZrm3D7tINRFmluwUkqqtshNzs/r73v63ZNWN
	/DjM7g0EfJEeZLydAi0WggdQGPKEhS+77erCQ2Dqn6WlOSdj1nQ9UOZQtSjyRO7CXCk8irEn7t0
	SgwMUd1t0LUuY6IRXCM7GuRQW0Oh07blSQfkm9hwIBaFjjQ4Tv8Jxdj+6PAlfGoBEjd0GeaMo7e
	6QY22L8udKtS6YMJjksePMmFs1ZD01zGkVHwdkW4Vmk/JO+emP1n5xf3OxScWP22YTCTVBwx1Go
	hEFueIqMFITh+wyfaRF9JT55m+4TD+oAb2YPPKWK+xGU5kwmSvMU61dPAu1MQHPzm4PvevIOB4y
	RaTN1DxSufbXco+uYDspQFrdvLTvjnCIUAMxQ+gfxHEC80G9NB+1LFo5as07ayG9rAOf/ceW4KF
	d2EnqOgOTBnDtvJ/OhvD1kW+uMUB/jfIUBh8xYTB+XKMJhS5RDmIzvz5Y9T9FCHX25FIDM8mpq4
	D534AEH3LTm6HfFFpwxkIK7y6+AZNkNVA5TTb0HmSTpdS5VU8YBMa933rQUYb2xPbP6kJ3J1QAu
	tx7SpouGW7jQQyS0AgEqPAX3KepHnTIe6/poBovqu1Ox0EnE
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr4476005c88.22.1795448397400;
        Mon, 23 Nov 2026 07:39:57 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:57 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/16] media: i2c: ov8856: do not power off twice on remove
Date: Mon, 23 Nov 2026 22:39:20 +0700
Message-Id: <20261123153927.2547169-10-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

ov8856_remove() calls ov8856_power_off() unconditionally after
pm_runtime_disable(). In the usual case the device is already runtime
suspended by then, because probe ends with pm_runtime_idle() and the
stream has stopped, so the regulators and the clock are disabled a
second time. That can trigger the unbalanced disable warnings from the
regulator and clock cores.

Only call ov8856_power_off() if the device is not runtime suspended, and
set the runtime PM status to suspended afterwards. This also covers the
case where the device is still runtime active, which the unconditional
call handled by accident.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 08304923d317 ("media: ov8856: Add runtime PM callbacks")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/ov8856.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index 1c879e461fa5..bc17deb945d9 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2367,7 +2367,10 @@ static void ov8856_remove(struct i2c_client *client)
 	pm_runtime_disable(ov8856->dev);
 	mutex_destroy(&ov8856->mutex);
 
-	ov8856_power_off(ov8856->dev);
+	if (!pm_runtime_status_suspended(ov8856->dev)) {
+		ov8856_power_off(ov8856->dev);
+		pm_runtime_set_suspended(ov8856->dev);
+	}
 }
 
 static int ov8856_probe(struct i2c_client *client)
-- 
2.25.1

