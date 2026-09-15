Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090983C1970
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 14:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789482761; cv=none; b=BhlLrxT6cxhRNfWkIMFH+kKAMhywkIkfplK/IMOtypoVD+XFgS6uebYJdd3iGgQF6pHGF5597evCxFbmnEFjtQvazgtVgeJuKecsmalyy7eCn9RkKzMpNOg/pUMfeP/RyP0f93dsIZ7nMVieGAvgVdMfiA+CjUfPMTIYLdVuRvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789482761; c=relaxed/simple;
	bh=NZGJJ76OT7pnGtlTTLVbGV1sNyqDJXn8A6m1uHnqt9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjmsmbPCW1k/irEzSy9GAewkP9ER0XYm3COjEXOrgcJSs+Cr7Z2JPtMDRcVvBFvQYvOFLaJ4agFcdraF2b8jiQRfjWZP2sh4Fh4qTHXtCoZ5KO5sIfdZ1nyxwvSZqTLXKHlbhXJmNYRbk4J0JxC0iBaiqvlCWx4fyWDAje5uiDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6N4GFCh; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6N4GFCh"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso562637566b.2
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789482758; x=1790087558; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXmryL3wvO3cdvxzlfBmjb/0ETnTJX518ezjoffucPQ=;
        b=B6N4GFChvE0Cmllv+WAwisvpp6F1hHfi/+z+9Yn5OMdaCocxX902XiMlPTkqQXUfMN
         zXITU5Ec2TkNCZk2zUaN6OIAT4acJhxAGibUZereoGmzYzOg9HXYIZjE5yi0Q8ddFRNl
         scIXpRJ6L8yii9HYEzCVZsNExhR1P+AEg7YYwvuSNLRrskUFDTwoIjGqY9l/+AXy4Dy6
         HgBHGQIIZEP5TqwERYiKG6nuKdNaANOpzDNHx5gVrY/tIzK4+ANlHxzRQoe7+iU3Xikr
         KC7L08eEVqKszWuah5xCbOJpmv9s6ZIBXCpR8kwZxu4/ieI6rf0z7Zrz+lAkmczBJsPJ
         X+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789482758; x=1790087558;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXmryL3wvO3cdvxzlfBmjb/0ETnTJX518ezjoffucPQ=;
        b=D2V+A7tTChHclx/gu4qFWYnd4C6af8uHDSIptSLswj+FpTW9A2rApMznJCsRMIVimJ
         KJEyOjmIxK1eOj2d8zkMV3Uy6MoPfEB+nOZFHKNP3DmfzjX3S/MqOz5vZOqkyESBjPEL
         oRbe2eI6duYvkQElCYXdgfH4QBkXtNPDDJB4qavf2C8MVfXdBJ9hGBlz3b0ZYAf2W7Wl
         VrzofLawl8+eMfHDf9aXosg4UcXBzOwMFL/28b4NGr3yPMQbS1E+xCYRMP2GbNWL6lC9
         yCQQFPj9UcJZ4QA2Dk/obKWEsOGhLSFfKYBw9yyrqg4jlP91JXkhHERdgMwd7ZdrhrvR
         ak0w==
X-Gm-Message-State: AFuF++ldVbgUel+V9pYndN3H1CLvteE95sJwOIWhX0auWbYpJG4T2386
	xq7JqI9NK4bVyP60PyBI7vMFdPIszptNZGvyth1VUG1nBFVFvPpTKD2+
X-Gm-Gg: AYBFou1wtXcevqw2RxToIEA41TDo9/DG4H2vb6gjM8cKqZu1ustNfox0hWNHYIfCnWO
	7FtzlOlc/0reI1Mp14qD84GujJK94Q6k+eOhxQoixK9VPOywuQ+cgPaWMCs1bWWqt//1u0C7BZv
	+SqTQAh1M0ZI6rF3DOSTh7wwcq4vYXPjL/dVJ6oqolKCCz5h20kWQ9vzvm9TqyWcQA0LRJOhfRg
	vfb6ELYuavNP4LnjtqjMhACRQ5yzFndKfjkXdbQwJ321rjKpBMj1tlPW3mo+H3ncaEDwV3bx7T3
	kWBD0XvAVc3M2cQHWI4I+B5iCJPFTfDmLAJnlZnYewqEFsokzr6AcGrfaF576ZWR83uAZ7zP+ae
	wFvJwde8TIiYt/1RENEiEQaRxYoglX/3W1bJ9y1g6MN9Pr9jYf8XMWkEUMr5pRLtN195KnEbaTV
	t4T5xNGq8FAnt2nFwzXRkYGDxmK2a5WSTk/Aoeg3rsrqlJ5Rm69p07OU7k3ozyw/UyPjNXw0L2p
	8Ii5A==
X-Received: by 2002:a17:907:fd8a:b0:c26:3107:71bb with SMTP id a640c23a62f3a-c29b879a01emr874169466b.24.1789482758031;
        Tue, 15 Sep 2026 07:32:38 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966066b76sm102979766b.29.2026.09.15.07.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:32:36 -0700 (PDT)
Date: Tue, 15 Sep 2026 17:32:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Antti Laakso <antti.laakso@linux.intel.com>
Cc: linux-media@vger.kernel.org
Subject: [bug report] media: ipu6: Move isys fw mapping to pci_probe
Message-ID: <aqlXAXcXvMM3HWtJ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Antti Laakso,

Commit 69ebb1bfc865 ("media: ipu6: Move isys fw mapping to
pci_probe") from Aug 27, 2026 (linux-next), leads to the following
Smatch static checker warning:

	drivers/media/pci/intel/ipu6/ipu6.c:865 ipu6_pci_remove()
	warn: variable dereferenced before check 'isp->psys' (see line 844)

drivers/media/pci/intel/ipu6/ipu6.c
    836 static void ipu6_pci_remove(struct pci_dev *pdev)
    837 {
    838         struct ipu6_device *isp = pci_get_drvdata(pdev);
    839         unsigned long dir;
    840 
    841         devm_free_irq(&pdev->dev, pdev->irq, isp);
    842 
    843         dir = IS_IPU7(isp) ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
    844         ipu6_cpd_free_pkg_dir(isp->psys);

ipu6_cpd_free_pkg_dir() dereferences isp->psys so

    845         ipu6_unmap_fw_region(isp->psys, dir);
    846 
    847         if (isp->isys) {

is too late.  Fortunately, it's also unnecessary.  Just delete it.

    848                 ipu6_cpd_free_pkg_dir(isp->isys);
    849                 if (isp->isys->fw_sgt.nents)
    850                         ipu6_unmap_fw_region(isp->isys, dir);
    851         }
    852 
    853         vfree(isp->fw_code_region);
    854         isp->fw_code_region = NULL;
    855 
    856         ipu6_buttress_exit(isp);
    857 
    858         ipu6_bus_del_devices(pdev);

I'm using ChatGPT to review Smatch warnings these days and it
gives a bonus bug that ipu6_bus_del_devices() frees isp->psys.

"ipu6_bus_del_devices() calls:

	auxiliary_device_delete(&adev->auxdev);
	auxiliary_device_uninit(&adev->auxdev);

The uninit drops the device reference, and ipu6_bus_release() frees
the containing ipu6_bus_device. Consequently, accessing isp->psys->mmu
or isp->isys->mmu afterward can use freed memory."

    859 
    860         pm_runtime_forbid(&pdev->dev);
    861         pm_runtime_get_noresume(&pdev->dev);
    862 
    863         release_firmware(isp->cpd_fw);
    864 
--> 865         if (isp->psys)
    866                 ipu6_mmu_cleanup(isp->psys->mmu);
                                         ^^^^^^^^^

    867         if (isp->isys)
    868                 ipu6_mmu_cleanup(isp->isys->mmu);
                                         ^^^^^^^^^
So these dereferences are a use after free.  Originally, this code saved
the pointer the mmus before calling ipu6_bus_del_devices().

    869 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
