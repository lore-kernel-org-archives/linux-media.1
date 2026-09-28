Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF2320A14
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790561224; cv=none; b=HNn9stU2osewtmv/1YJbEODmnuQqOQjZRIxSqJLd8bklbrvoaei9ZHQ7EHWxmM6E0ZGEYM8YlEd2AhcrQELXlPjAeMxLd86kDyEL4ZT/qAMPd1wQXX5VP03ZW0uROQ/7Bvey9DPEUberYRJHnaa2IXBEaSGJtCYnu90Fa45vZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790561224; c=relaxed/simple;
	bh=XUsXFTxheSAFdTW8aK0D0SPzfyf0t3peqPWWVm/0jkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GROi/KaSIfIJbwSkfcd7A2mjIi1lVfYuvztnIwr9LID6PfeUWn0H+Xo89bu2cAyH0zeffjfiOo23VpqM2W5TCzhbBTM+QOWg1YNtsLoYRbYaTybhxoi6IjWYiaOrvJx5jTTesm9SPxfVLffy31EPAPzbluBPjhaMJ0uIMQSPGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVSxc0p4; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVSxc0p4"
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c67e5059f8so755489e0c.1
        for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 19:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790561222; x=1791166022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qMGexpSEkGHJZ/D2Lbg3IHJlRXuYl7WSvOPqKWER44=;
        b=UVSxc0p4Ozwx2tujQg10gc5rrih0jjWnkx5eywzXnqRagza94MKAH2byryMb7NErYa
         3HFKExzw9SD9YQphP+A3fvATrlTsryMh0Bad7agZxfz/7b5nf2CMignQ6sDK1U/RMHAl
         Ml4Wv66J5ePwpWjYt3Hk/FR9q4/Rs/QiUEYJDGBYi77RJUAyii8BEtJrzANkVaqAvj9E
         HiB/4ZwT7tMEdq+kq0oLgQkw1djk9wXZ9H0iR9kdWOVn+t0yTU/QTJlJ2E8oaGMEnbQJ
         NnzuYuPUGIba/FySnXTE7rpCfoYSWqwdyoA74iYwcq6STPOGy+bWG7m4QDLZAtMHREAQ
         jj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790561222; x=1791166022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qMGexpSEkGHJZ/D2Lbg3IHJlRXuYl7WSvOPqKWER44=;
        b=Q7+UHIVSmm90NAhurTRkt01bGJShvZcMbzdcaFE3kkLskXCFwS9l9RsIdFXN3/KTeu
         TN4cpH5ZDqN1LdTEukBKDyHiXo1Ai37QMd601xHCLLp7DFpcz/b7KKvb3j+tVox2LM54
         dOx67dTB94NhTx59W9QIxlbvEs800B7u0gMD/8LMpTXyOLdr7CzXsjvuxTAjJyjDVWu+
         8nYWqXpHoE9kkxRfoKU2HUpBct1XH+XV2l/4eOrVEaO6abE5rcPXHI59rIgE1NlJGlva
         52d46PIYuEFK1jCNXL+tfm0KFlw4udGon68Npnyq9EBdAL4sXxvSlONhC4W0G0BTuQyE
         dXhg==
X-Forwarded-Encrypted: i=1; AKwUvBz+RZCjIkYdJ4Ng5nMrcqG0bX6x2nUTTaEyXpf7B10VSJ2DAZMb+9/NnZLfmBuqQ2YlyRe2pH3zLpi/EA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJqYjYXDxtbUYOXSGvngzQMnAGuxCqGIiLGm6meCgqgF5mymhSa
	afyhXJcBw0eico+baZ6mC9fODnuV4dJJ/8PjdwhXlRiLlhmp+TF/vJQW
X-Gm-Gg: AYBFou28Grt9+3tnWK3yw+nsOeqi2InOEpmpgsennt4GHrEevUf6MoAl8DAmNS7gjVr
	+V8rO8dLQoDVFbFee0ca+fQcVSmbNU0oTj12VNuDrhl9cxdrah3DOzAndQPuH/iLk852JfB7sfS
	dJuPdvJ75vON+w4U/vu9zovTC/wkCzxUs/mw0WVmrg9/TP1sh5hRPL9rcSa4ob3a9Gv3Axq4rU8
	8llpL+iKYQJPRlxW4QsNceua/U0VR/TFljjAVzQ50DS2H0hBpfay+9JeYRrkiFSG/Joc1am4jKa
	7ho+6r5zzkPWBBwLogTUjlY3I+6uCbJyiGEYxsNv8icHHvt4hqcpiPzeY3I/75bauvszlaieU9p
	InpUW96MNRP1czpscLKNuj9dLptJKHGM/J1/1yuVDf0FLTPJUl/6/AlyL841z0/J/0vWL+2XTX2
	Z3Hh5irWn0vrxYjKaKq7S4Tjexfl7AHOjwke1/bvrenZ6goDOwhudRvtdKNyRITYAI1ViobpawJ
	1sBVxhUyPuMHhRGym4BSQXZJ5relDvYmuRJBtyJLlU02ltoR+2Dy+5+MPvoDzaLCtOJ07Aw8+Sl
	Mx+sJAFVySNwlrOFZaT4ye0=
X-Received: by 2002:a05:6122:1d47:b0:5cf:1982:abc0 with SMTP id 71dfb90a1353d-5cf1982ad6amr837911e0c.11.1790561221818;
        Sun, 27 Sep 2026 19:07:01 -0700 (PDT)
Received: from fedora.tail004876.ts.net (modemcable164.224-80-70.mc.videotron.ca. [70.80.224.164])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde6b43916sm7597363e0c.18.2026.09.27.19.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:07:01 -0700 (PDT)
Sender: Arthur Girard <arthgira@gmail.com>
From: arthgirard <mailarthurgirard@gmail.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] media: i2c: og0ve1b: Add support for OmniVision OG0VA1B
Date: Sun, 27 Sep 2026 22:03:55 -0400
Message-ID: <20260928020355.86012-1-mailarthurgirard@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915-og0va1b-v7-3-3a4b6d7360ec@oss.qualcomm.com>
References: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com> <20260915-og0va1b-v7-3-3a4b6d7360ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arthur Girard <mailarthurgirard@gmail.com>

Hi Wenmeng,

On Tue, Sep 15, 2026 at 02:54:14PM +0800, Wenmeng Liu wrote:
> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with

The OG0VA1B is also the IR sensor on some x86 laptops with Intel IPU6.
I tried this series on an HP Spectre x360 14-eu0xxx (Meteor Lake),
where the sensor is ACPI device OVTI00AB: 1 lane, 19.2 MHz clock, same
as your og0va1b_data. On top of v7 applied to 7.2.7 it needed three
small things to work:

1. An ACPI match for OVTI00AB pointing at og0va1b_data.

2. An ipu-bridge entry, IPU_SENSOR_CONFIG("OVTI00AB", 1, 480000000),
   so the IPU6 creates the graph endpoint.

3. -EPROBE_DEFER instead of -EINVAL in og0ve1b_check_hwcfg() when
   fwnode_graph_get_next_endpoint() returns NULL. The driver can probe
   before ipu-bridge has created the endpoint, and on one boot out of a
   handful it lost that race and failed for good.

With those, the 640x480 Y10 mode streams fine through the IPU6 ISYS and
the images look right. I've been using it for face authentication.

None of this is needed for your DT use case, so I don't want to hold the
series up. I can send the three as follow-up patches once it's merged,
unless you'd rather fold the ACPI match and the deferral into v8.

Thanks,
Arthur
