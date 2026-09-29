Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77AA5304CF
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 14:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692665; cv=none; b=INnMLB8Q07dTSpGUmudneid8G4+SJhE/Ao2bjsXsfEAjEM8rqAkVrm6grrtQD/Wv4UnmUGw2Bp17v2CKdmQOcP/Wr8G9W98bWqmCSJ1kMvpkhy9+VsH+tNe/PKt3xOSvSIsF6IJ1XJdRy81iDq7p80jN9ZpLovT7KY3O7ibQEHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692665; c=relaxed/simple;
	bh=9u3a2NWAPRmai8vcI0/NGUrf/F7BbV2a0ai78l+zKMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuV17UVMSQjeSdTScFlpssQg9FWQlMGQJrk70qxWxe/1BA26ljY5Ia3OuphQwJr6qGeMvDtFnEwIDnw9xQc/EHqrCDUldDXYYXWVdUOC2dfGDjx5c0P85/VDchQvErE7EXoNn/82IRiEbAhRNVqvcO7+n0iZPMMwVi52MhHiiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4VBhVZJ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4VBhVZJ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so27319815e9.1
        for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692658; x=1791297458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jy7sEpmEwJbZl5O5isZiPG/sgCmuKe0E6KT8jBOOk0U=;
        b=O4VBhVZJyV0UQgvfbm1KW9DF4eXHUY77nfwmjXxavbuewBG1ijVmlttnopGNNRP1WV
         xXhvAR+nU+VCNqqfbflvAEKnnMuIbodlhCXYK/FuyfONNazfsNWAPvzzNnYhOR/JmjBl
         fJ4C0QSwu4Mi0OWinAave6799AGaHx5vQwwb8gT7I2nulGbA2VtAx4R+5uejT05GkM9Q
         GFfWIDn1exX6/gSeQ05/A/Z32B+O8Rc3ZL7YhAR8uwPZvjIwO68y36/szzA/zMryN+lQ
         JpSUmI0eIvUChKiowun0eAMN39uTS7nFGK4z3CNNjrANYeJO6r+E1PjOwTimJMN7MeOP
         IDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692658; x=1791297458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jy7sEpmEwJbZl5O5isZiPG/sgCmuKe0E6KT8jBOOk0U=;
        b=qHAcw2hGj+py5tr9i13bUxgLuNlr/Wc7Yn0zKv8w2E91PLhthdV697VX+xZwYVTXRN
         e2VQon/csHd/OS8UJOKXb2lM5+jPUg+eGGbCBlbtJLYte1KewyIt2U5Hg9YTyZAAuk8r
         KaSeeyypPxXtAjJv9YoheR4QwzqNkIzAWevTrPLB6JHg/62rlFawa3+RGEmKbwZwSq3n
         XlZOqjNDpsslFfwQ8GCWG75b4lHKe0WcmNGQ7gpw43GvtLO/42mHznqaKFzp2kAwvgkX
         jNdhCtQ5UWgHtD//iSodXoN1EyPokDlo548vYA+oY/HgBzIGchWIdlhJcUw025HtpKHT
         hvyw==
X-Gm-Message-State: AFuF++k4Xu0wdq3xbvzIj6j5XZ+5ut5lUVzGkynpwccBWYMCngLA1i/8
	IguQt7fftPqeJPQdQylALtCBPQYFVS3BWp6HRR7zORFM+hThGx1RVfO1411/2A==
X-Gm-Gg: AYBFou2uRCEpoI00QnNfdxY6Ka4WTTH2BXj1kWPnb1pLjpfBJfJshQ6jnmnemoBFMq8
	DyLWBXd+dUwxbUuxDrKRjzwlKVWF+IX9pvTkKkutloF5OFHdUx0CaJbu56G/lpmXX/8sbwmhFXR
	HcOQMKhVLVF+8IQgvnyLxkgKeD2YkICjC1Oab4ALy/y2nNyyieucUgtyfrE6m7zcGByYV11OLu5
	fgvsfXzOjd7KbCpIEIWuRdIMTxvDmYstySh+PPlJ+jL15599Wn6ow8ij4ceW9lmt+4n8ZhBZOfp
	Li9dzfGStz+QUPAs9Vt6LpmFzDR2oi3JxbgRbmFgcx28kMRBw7tJDWHWBHQFVJLPJ58DhtnVl40
	vyNlvlBZ1gWQx/to9YSiAw1ELqhqbim4rPxGONbErVsD4Z+MK3YPcPusS8LTdNw2IyS6OL/bOcH
	PyVcPig80UOfYJdkU6SVnfdtDvQ/O7JHtzfW2LL3rge1l5WoPGLFVfruLjL2D7jNPmBPYta5trQ
	Srgupf2xwEsaSLdSveh6QJuEhV8WIuhPPlWvo/yZqh9qO740sH7uJ9TW1s=
X-Received: by 2002:a05:600c:530e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a013ea30d3mr4647925e9.35.1790692657899;
        Tue, 29 Sep 2026 07:37:37 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8f93csm89716995e9.5.2026.09.29.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:37:37 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 3/3] media: ipu6: Check the ipu7 output pin queue before completing a buffer
Date: Tue, 29 Sep 2026 15:37:31 +0100
Message-ID: <20260929143731.43358-4-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929143731.43358-1-devnexen@gmail.com>
References: <20260929143731.43358-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PIN_DATA_READY response for an unconfigured pin dereferences a NULL
output_pins_queue entry in interrupt context. Check the queue like the
ipu6 path does.

Fixes: f268203d74ff ("media: ipu6: Add ipu7 isr handler")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
index 379a84b595fd..d92d4cad30e6 100644
--- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
@@ -644,7 +644,8 @@ static int ipu7_isys_isr_one(struct ipu6_bus_device *adev)
 					   struct isys_fw_msgs, dummy);
 
 		ipu6_put_fw_msg_buf(ipu6_bus_get_drvdata(adev), isys_fw_msg);
-		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS)
+		if (resp->pin_id < IPU6_ISYS_OUTPUT_PINS &&
+		    stream->output_pins_queue[resp->pin_id])
 			ipu6_stream_buf_ready(stream, resp->pin_id,
 					      resp->pin.addr, ts, 0);
 		else
-- 
2.55.0

